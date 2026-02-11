#!/usr/bin/env -S uv run --script
# /// script
# dependencies = ["case-converter", "catkin-pkg", "Jinja2", "PyGithub"]
# ///

"""
Take an url to a ROS repo and a distro to generate nix packages.
Currently github only.
"""

from logging import basicConfig, getLogger
from os import environ
from pathlib import Path
from subprocess import check_call, check_output
from tomllib import load as tload

from caseconverter import kebabcase
from catkin_pkg.package import parse_package_string
from github import Auth, Github
from jinja2 import Environment, Template

from .lib import LICENSES, get_parser, HashesFile, get_rosdeps, SPDX_LICENSES

TEMPLATE = """{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs{% for scope in native_scopes %}
  {{ scope }},{% endfor %}

  # buildInputs{% for scope in build_scopes %}
  {{ scope }},{% endfor %}

  # propagatedBuildInputs{% for scope in propagated_scopes %}
  {{ scope }},{% endfor %}

  # checkInputs{% for scope in check_scopes %}
  {{ scope }},{% endfor %}
}:
buildRosPackage rec {
  pname = "ros-{{ distro }}-{{ pkg.name|kebab }}";
  version = "{{ pkg.version }}";

  src = fetchFromGitHub {
    owner = "{{ repo.owner.login }}";
    repo = "{{ repo.name }}";
    {{ rev }};
    hash = "{{ hash }}";
  };
  sourceRoot = "source/{{ package }}";

  buildType = "{{ pkg.get_build_type() }}";

  nativeBuildInputs = [{% for dep in native %}
    {{ dep }}{% endfor %}
  ];
  buildInputs = [{% for dep in build %}
    {{ dep }}{% endfor %}
  ];
  propagatedBuildInputs = [{% for dep in propagated %}
    {{ dep }}{% endfor %}
  ];
  checkInputs = [{% for dep in check %}
    {{ dep }}{% endfor %}
  ];

  doCheck = {{ do_check }};

  meta = {
    description = "{{ pkg.description }}";
    license = with lib.licenses; [ {% for lic in licenses %}{{ lic }} {% endfor %}];
    homepage = "{{ repo.html_url }}";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}"""

logger = getLogger("ros2nix")
parser = get_parser(prog="ros2nix", description=__doc__)


class Overrides:
    def __init__(self, data):
        def default(key, val):
            return data[key] if key in data else val

        self.native = default("native", [])
        self.build = default("build", [])
        self.propagated = default("propagated", [])
        self.check = default("check", [])
        self.do_check = default("do_check", True)


class Repo(HashesFile):
    def __init__(
        self,
        gh: Github,
        repo: str | int,
        token: str,
        rosdeps: dict[str, list[str]],
        hashes_file: Path,
        branch: str | None = None,
        distro: str | None = None,
        packages: list | None = None,
        repo_overrides: Overrides | None = None,
    ):
        if isinstance(repo, str):
            repo = repo.removeprefix("https://").removeprefix("github.com/")
        logger.info("Repo: %s", repo)
        self.repo = gh.get_repo(repo)
        if branch is None:
            branch = self.repo.default_branch
        logger.info("Branch: %s", branch)
        if distro is None:
            distro = branch.split("-")[0]
        if distro == "alum":  # PAL specific thing
            distro = "humble"
        self.distro = distro
        logger.info("Distro: %s", self.distro)

        self.path = Path("ros-pkgs") / self.distro
        if not self.path.is_dir():
            logger.error("%s is not a directory", self.path)
            return

        self.branch = self.repo.get_branch(branch)

        tree = self.repo.get_git_tree(sha=self.branch.commit.sha, recursive=True)
        self.packages = [
            "/".join(f.path.split("/")[:-1])
            for f in tree.tree
            if f.path.split("/")[-1] == "package.xml"
        ]

        env = Environment()
        env.filters["kebab"] = kebabcase
        template = env.from_string(TEMPLATE, {"distro": self.distro})

        self.token = token
        self.rosdeps = rosdeps
        self.hashes_file = hashes_file
        self.load_hashes()

        for package in self.packages:
            pname = package or self.repo.name
            overrides = repo_overrides or Overrides(
                packages[pname] if packages and pname in packages else {}
            )
            Package(repo=self, package=package, template=template, overrides=overrides)

        self.dump_hashes()


class Package:
    def __init__(
        self, repo: Repo, package: str, template: Template, overrides: Overrides
    ):
        logger.info("Package: %s", package or repo.repo.name)
        content = repo.repo.get_contents(f"{package}/package.xml", ref=repo.branch.name)
        pkg = parse_package_string(content.decoded_content.decode())

        licenses = []
        for lic in pkg.licenses:
            if lic not in SPDX_LICENSES:
                logger.warning(
                    "Invalid %s %s license: %s", repo.repo.full_name, package, lic
                )
            if nlic := LICENSES.get(lic):
                licenses.append(nlic)
            else:
                logger.warning(
                    "Unknown %s %s license: %s", repo.repo.full_name, package, lic
                )
                licenses.append("unfree")

        def rosdep(k: str) -> list[str]:
            return [p for p in repo.rosdeps.get(k, [kebabcase(k)])]

        def sort_deps(deps, overrides, blacklist):
            deps = [rosdep(dep.name) for dep in deps if dep.evaluate_condition(environ)]
            deps = {i for d in deps for i in d} | set(overrides)

            return sorted(deps - set(blacklist))

        def deps_scopes(deps, blacklist):
            scopes = {dep.split(".")[0] for dep in deps}
            return sorted(scopes - set(blacklist))

        hash_url = f"{repo.repo.html_url}/archive"
        for tag in repo.repo.get_tags():
            if tag.name == pkg.version:
                rev = "tag = version"
                hash_url = f"{hash_url}/refs/tags/{pkg.version}.tar.gz"
                break
            elif tag.name == f"v{pkg.version}":
                rev = 'tag = "v${version}"'
                hash_url = f"{hash_url}/refs/tags/v{pkg.version}.tar.gz"
                break
        else:
            rev = f'rev = "{repo.branch.commit.sha}"'
            hash_url = f"{hash_url}/{repo.branch.commit.sha}.tar.gz"

        if hash_url in repo.hashes:
            hash = repo.hashes[hash_url]
        else:
            logger.info("Prefetch %s", hash_url)
            hash = check_output(["nurl", "-H", hash_url], text=True).strip()
            repo.hashes[hash_url] = hash

        native = sort_deps(pkg.buildtool_depends, overrides.native, [])
        native_scopes = deps_scopes(native, [])
        build = sort_deps(pkg.build_depends, overrides.build, native)
        build_scopes = deps_scopes(build, native_scopes)
        propagated = sort_deps(
            pkg.exec_depends, overrides.propagated, [*native, *build]
        )
        propagated_scopes = deps_scopes(propagated, [*native_scopes, *build_scopes])
        check = sort_deps(
            pkg.test_depends, overrides.check, [*native, *build, *propagated]
        )
        check_scopes = deps_scopes(
            check, [*native_scopes, *build_scopes, *propagated_scopes]
        )
        nix = template.render(
            pkg=pkg,
            rev=rev,
            hash=hash,
            package=package,
            licenses=licenses,
            repo=repo.repo,
            native=native,
            build=build,
            propagated=propagated,
            check=check,
            native_scopes=native_scopes,
            build_scopes=build_scopes,
            propagated_scopes=propagated_scopes,
            check_scopes=check_scopes,
            do_check=str(overrides.do_check).lower(),
        )
        path = repo.path / f"{kebabcase(pkg.name)}.nix"
        path.write_text(nix)
        check_call(["deadnix", path])
        check_call(["nixfmt", path])


def main():
    if "GITHUB_TOKEN" in environ:
        token = environ["GITHUB_TOKEN"]
    elif "GITHUB_TOKEN_CMD" in environ:
        token = check_output(environ["GITHUB_TOKEN_CMD"].split(), text=True).strip()
    else:
        err = "missing GITHUB_TOKEN or GITHUB_TOKEN_CMD"
        raise RuntimeError(err)

    args = parser.parse_args()

    basicConfig(level=30 - 10 * args.verbose + 10 * args.quiet)

    with args.config_file.open("rb") as f:
        cfg = tload(f)

    auth = Auth.Token(token)
    with Github(auth=auth) as gh:
        rosdeps = get_rosdeps(gh)
        for distro, conf in cfg.items():
            if args.distro and distro != args.distro:
                logger.debug("ignore distro %s", distro)
                continue
            environ["ROS_DISTRO"] = distro
            for repo, repo_conf in conf.items():
                if args.repo and repo != args.repo:
                    logger.debug("ignore repo %s", repo)
                    continue
                Repo(
                    gh=gh,
                    distro=distro,
                    repo=repo,
                    token=token,
                    rosdeps=rosdeps,
                    hashes_file=args.hashes_file,
                    branch=repo_conf["branch"] if "branch" in repo_conf else None,
                    packages=repo_conf["packages"] if "packages" in repo_conf else None,
                    repo_overrides=Overrides(
                        {
                            k: v
                            for k, v in repo_conf.items()
                            if k
                            in [
                                "native",
                                "build",
                                "propagated",
                                "check",
                                "do_check",
                            ]
                        }
                    )
                    if "packages" not in repo_conf
                    else None,
                )


if __name__ == "__main__":
    main()

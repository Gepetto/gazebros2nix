from argparse import ArgumentParser
from json import load as jload, dump as jdump
from os import environ
from pathlib import Path
from subprocess import check_output
from yaml import load as yload

try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader

from github import Github

# spdx to nixpkgs license ids
LICENSES = {
    "Apache License 2.0": "asl20",
    "Apache 2.0": "asl20",
    "Apache-2.0": "asl20",
    "BSD-2-Clause": "bsd2",
    "BSD-3-Clause": "bsd3",
    "BSD-3-clause": "bsd3",
}
SPDX_LICENSES = [
    "Apache-2.0",
    "BSD-2-Clause",
    "BSD-3-Clause",
]


def get_parser(prog: str, description: str) -> ArgumentParser:
    parser = ArgumentParser(prog=prog, description=description)
    parser.add_argument("distro", nargs="?", help="generate only this distro")
    parser.add_argument("repo", nargs="?", help="generate only this repo")
    parser.add_argument(
        "-c",
        "--config-file",
        default=Path(f"{prog}.toml"),
        type=Path,
        help="configuration file",
    )
    parser.add_argument(
        "-H",
        "--hashes-file",
        default=Path("hashes.json"),
        type=Path,
        help="hashes file",
    )

    parser.add_argument(
        "-q",
        "--quiet",
        action="count",
        default=int(environ.get("QUIET", 0)),
        help="decrement verbosity level",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=int(environ.get("VERBOSITY", 0)),
        help="increment verbosity level",
    )

    return parser


class HashesFile:
    """
    get hashes in json file with nurl
    """

    hashes_file: Path
    token: str

    def load_hashes(self):
        if self.hashes_file.exists():
            with self.hashes_file.open("r") as f:
                self.hashes = jload(f)
        else:
            self.hashes = {}

    def dump_hashes(self):
        with self.hashes_file.open("w") as f:
            jdump(self.hashes, f, indent=2, sort_keys=True)

    def get_hash(self, url: str, tag: str = "", patch: bool = False) -> str:
        key = f"{url} {tag}".strip()
        if key not in self.hashes:
            self.hashes[key] = check_output(
                f"nurl -H {key}".split(),
                env={**environ, "GITHUB_TOKEN": self.token},
                text=True,
            ).strip()
        return self.hashes[key]


def get_rosdeps(gh: Github) -> dict[str, list[str]]:
    rosdistro = gh.get_repo("ros/rosdistro")
    ref = rosdistro.default_branch
    base = rosdistro.get_contents("rosdep/base.yaml", ref=ref)
    base_db = yload(base.decoded_content.decode(), Loader=Loader)
    python = rosdistro.get_contents("rosdep/python.yaml", ref=ref)
    python_db = yload(python.decoded_content.decode(), Loader=Loader)
    return {
        k: v["nixos"] for k, v in [*base_db.items(), *python_db.items()] if "nixos" in v
    }

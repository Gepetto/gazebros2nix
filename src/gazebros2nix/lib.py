from argparse import ArgumentParser
from json import load, dump
from os import environ
from pathlib import Path
from subprocess import check_output

LICENSES = {
    "Apache License 2.0": "asl20",
    "Apache-2.0": "asl20",  # https://github.com/ros-controls/ros2_control_demos
}


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
                self.hashes = load(f)
        else:
            self.hashes = {}

    def dump_hashes(self):
        with self.hashes_file.open("w") as f:
            dump(self.hashes, f, indent=2, sort_keys=True)

    def get_hash(self, url: str, tag: str = "", patch: bool = False) -> str:
        key = f"{url} {tag}".strip()
        if key not in self.hashes:
            if patch:
                sri = check_output(["nix-prefetch-url", url], text=True).strip()
                hash = check_output(
                    ["nix", "hash", "convert", "--hash-algo", "sha256", sri], text=True
                ).strip()
            else:
                hash = check_output(
                    f"nurl -H {key}".split(),
                    env={**environ, "GITHUB_TOKEN": self.token},
                    text=True,
                ).strip()
            self.hashes[key] = hash
        return self.hashes[key]

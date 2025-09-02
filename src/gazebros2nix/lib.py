from argparse import ArgumentParser
from os import environ

LICENSES = {
    "Apache License 2.0": "asl20",
    "Apache-2.0": "asl20",  # https://github.com/ros-controls/ros2_control_demos
}


def get_parser(prog: str, description: str) -> ArgumentParser:
    parser = ArgumentParser(prog=prog, description=description)
    parser.add_argument("distro", nargs="?", help="generate only this distro")
    parser.add_argument("repo", nargs="?", help="generate only this repo")
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

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  ament-index-python,
  launch,
  launch-ros,
  python3Packages,

  # propagatedBuildInputs

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
}:
buildRosPackage rec {
  pname = "ros-jazzy-launch-pal";
  version = "0.20.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "launch_pal";
    rev = "3f1d6a195bf04cb9e318cdca17952ccd4a54fc8a";
    hash = "sha256-uLe2AS1vTghoRlWNEfgD9vGtwqzeWhPx8m1QC5sgHYs=";
  };
  sourceRoot = "source/";

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    ament-index-python
    launch
    launch-ros
    python3Packages.jinja2
    python3Packages.pyyaml
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];

  doCheck = true;

  meta = {
    description = "Utilities for launch files";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/launch_pal";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

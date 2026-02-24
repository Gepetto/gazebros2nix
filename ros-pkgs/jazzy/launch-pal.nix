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
  version = "0.1.15";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "launch_pal";
    rev = "a9113d96f6d5691f6d24930f184f9be085b582d7";
    hash = "sha256-G4mxW9HGKcdnvx5PKTveoJxN5LzfmmEG6Ug1PvYIXjw=";
  };
  sourceRoot = "source/";

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    ament-index-python
    launch
    launch-ros
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
    homepage = "https://github.com/Tiago-Harmonic/launch_pal";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

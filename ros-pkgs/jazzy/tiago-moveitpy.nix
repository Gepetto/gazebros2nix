{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  moveit-py,
  rclpy,
  tiago-moveit-config,

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
  python3Packages,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-moveitpy";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_moveitpy";
    rev = "18a068245c68133aeda88d14d4de4be814f1ae4f";
    hash = "sha256-r5TIjgEm1eVp1NdFgl8wVJHGkWClZbBoyewAs8orbI8=";
  };
  sourceRoot = "source/";

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    moveit-py
    rclpy
    tiago-moveit-config
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    python3Packages.pytest
  ];

  doCheck = true;

  meta = {
    description = "Tiago MoveItPy boilerplate for Gazebo Harmonic";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_moveitpy";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

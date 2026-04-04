{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs

  # propagatedBuildInputs
  play-motion2,
  rclpy,
  ros2cli,

  # checkInputs
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  python3Packages,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-play-motion2-cli";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "play_motion2";
    rev = "f1bbfcc4c9fbe9a05181a18214003360480d8575";
    hash = "sha256-Cq3r+KePWMpTvuo7Z4U7NQNyvhfffUTNymYkauqcYFA=";
  };
  sourceRoot = "source/play_motion2_cli";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    play-motion2
    rclpy
    ros2cli
  ];
  checkInputs = [
    ament-copyright
    ament-flake8
    ament-pep257
    ament-xmllint
    launch
    launch-ros
    launch-testing
    launch-testing-ros
    python3Packages.pytest
    python3Packages.pytest-timeout
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "The play_motion command for ROS 2 command line tools.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/play_motion2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

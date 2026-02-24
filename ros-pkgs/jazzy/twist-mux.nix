{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  diagnostic-updater,
  geometry-msgs,
  rclcpp,
  std-msgs,
  visualization-msgs,

  # propagatedBuildInputs
  twist-mux-msgs,

  # checkInputs
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
}:
buildRosPackage rec {
  pname = "ros-jazzy-twist-mux";
  version = "4.4.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "twist_mux";
    tag = version;
    hash = "sha256-x6fGds/ictUiS2Vj61hHU9jN+QcuXP9AwFwFoPOacs0=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    diagnostic-updater
    geometry-msgs
    rclcpp
    std-msgs
    visualization-msgs
  ];
  propagatedBuildInputs = [
    twist-mux-msgs
  ];
  checkInputs = [
    ament-cmake-xmllint
    ament-lint-auto
    ament-lint-common
    launch
    launch-testing
    launch-testing-ament-cmake
    launch-testing-ros
  ];

  doCheck = false;

  meta = {
    description = "Twist multiplexer, which multiplex several velocity commands (topics) and
      allows to priorize or disable them (locks).";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/twist_mux";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

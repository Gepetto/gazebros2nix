{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  ament-index-python,
  diagnostic-aggregator,
  joy-linux,
  joy-teleop,
  pal-pro-gripper-wrapper,
  play-motion2,
  play-motion2-cli,
  tiago-pro-controller-configuration,
  tiago-pro-head-bringup,
  twist-mux,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-bringup";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "d835dc4d99ba9e6614f5cd232eafc7c243d4c79c";
    hash = "sha256-NRnr88i8S4dFRy5pp4G5UiC/CPlwuhJoJdM6Q75KW3Y=";
  };
  sourceRoot = "source/tiago_pro_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    ament-index-python
    diagnostic-aggregator
    joy-linux
    joy-teleop
    pal-pro-gripper-wrapper
    play-motion2
    play-motion2-cli
    tiago-pro-controller-configuration
    tiago-pro-head-bringup
    twist-mux
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Launch files to upload the TIAGo pro robot description and start the controllers";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

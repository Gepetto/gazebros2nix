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

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-bringup";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "e600f63f46ddeaa01bbcd8fcde3ed3d69cef6d55";
    hash = "sha256-vnCX8RKZbpkLUig1bV1NGUAbK75qmT/ei7Jq/c29894=";
  };
  sourceRoot = "source/tiago_pro_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
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
  nativeCheckInputs = [
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

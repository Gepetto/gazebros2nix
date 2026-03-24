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
  joy,
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
  pname = "ros-humble-tiago-pro-bringup";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_robot";
    tag = version;
    hash = "sha256-oBKqkn23B3gldzZZ3LyAHt1uXSKJdspKkBhbN3VZj0Y=";
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
    joy
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
    homepage = "https://github.com/pal-robotics/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

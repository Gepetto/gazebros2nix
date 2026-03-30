{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  omni-base-controller-configuration,
  pal-pro-gripper-controller-configuration,
  pal-sea-arm-controller-configuration,
  ros2controlcli,
  tiago-pro-head-controller-configuration,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-controller-configuration";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "e600f63f46ddeaa01bbcd8fcde3ed3d69cef6d55";
    hash = "sha256-vnCX8RKZbpkLUig1bV1NGUAbK75qmT/ei7Jq/c29894=";
  };
  sourceRoot = "source/tiago_pro_controller_configuration";

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
    joint-state-broadcaster
    joint-trajectory-controller
    launch
    launch-pal
    omni-base-controller-configuration
    pal-pro-gripper-controller-configuration
    pal-sea-arm-controller-configuration
    ros2controlcli
    tiago-pro-head-controller-configuration
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "The tiago_pro_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

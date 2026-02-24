{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  diff-drive-controller,
  force-torque-sensor-broadcaster,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  omni-base-controller-configuration,
  pal-gripper-controller-configuration,
  pal-hey5-controller-configuration,
  pal-robotiq-controller-configuration,
  pmb2-controller-configuration,
  ros2controlcli,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-controller-configuration";
  version = "4.2.20";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_robot";
    rev = "bc2ac55a0be2c49ccca6e09f6ff533902c9fb8e2";
    hash = "sha256-iaGv8DQAcI732xo/zBFs+7HOYdgtSc1/OaNK+mGWk4Y=";
  };
  sourceRoot = "source/tiago_controller_configuration";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    controller-manager
    diff-drive-controller
    force-torque-sensor-broadcaster
    imu-sensor-broadcaster
    joint-state-broadcaster
    joint-trajectory-controller
    launch
    launch-pal
    omni-base-controller-configuration
    pal-gripper-controller-configuration
    pal-hey5-controller-configuration
    pal-robotiq-controller-configuration
    pmb2-controller-configuration
    ros2controlcli
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Configuration and launch files of TIAGo's controllers";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

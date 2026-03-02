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
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  launch,
  launch-pal,
  ros2controlcli,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-controller-configuration";
  version = "5.0.26";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_robot";
    rev = "984ac253d667ef0757348eaefcbb4404d599e575";
    hash = "sha256-Wonz2lRRb09m2G4IInkAepTH9zvUyJQY0nC8WLtDUdk=";
  };
  sourceRoot = "source/pmb2_controller_configuration";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    controller-manager
    diff-drive-controller
    imu-sensor-broadcaster
    joint-state-broadcaster
    launch
    launch-pal
    ros2controlcli
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Launch files and scripts needed to configure
    the controllers of the PMB2 robot.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

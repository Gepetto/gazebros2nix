{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  rclcpp,

  # propagatedBuildInputs
  pal-robotiq-controller-configuration,
  pal-robotiq-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pal-robotiq-gripper";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pal_robotiq_gripper";
    tag = version;
    hash = "sha256-Q9RkXyP4gcz/wopoeKzna3Y1oUDmYBE/yGlo/lRdzNU=";
  };
  sourceRoot = "source/pal_robotiq_gripper";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    rclcpp
  ];
  propagatedBuildInputs = [
    pal-robotiq-controller-configuration
    pal-robotiq-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "Robotiq Gripper Definition Packages";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pal_robotiq_gripper";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

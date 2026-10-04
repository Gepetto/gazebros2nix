{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  doxygen,
  rosdoc2,

  # buildInputs
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,

  # propagatedBuildInputs
  pico-dual-drv8316c-ros2-hardware-interface,

  # checkInputs
  ament-cmake-gtest,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-dual-motor-testbed-hardware";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "8869d16e271536089e7ba288217b0ff514614113";
    hash = "sha256-i2gpZkyHXvELIeQbHyONA58sotpB07qKROD3LRH4C64=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_hardware";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    doxygen
    rosdoc2
  ];
  buildInputs = [
    ament-cmake
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  propagatedBuildInputs = [
    hardware-interface
    pico-dual-drv8316c-ros2-hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  checkInputs = [
    ament-cmake-gtest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "ros2_control hardware plugins for the ODRI dual motor testbed.
    FiveBarSystem wraps the hardware plugin driving motor_1/motor_2 and
    exports the five-bar passive joints as state-only interfaces, computed
    from the motor encoders with the exact direct geometric model.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

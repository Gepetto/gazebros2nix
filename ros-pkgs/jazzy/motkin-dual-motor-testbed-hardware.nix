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
  motkin-ros2-hardware-interface,

  # checkInputs
  ament-cmake-gtest,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-hardware";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-xSp2/KlOReis2AaLKqJjMEd/7BfmfrGBFG3HfobqBqM=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_hardware";

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
    motkin-ros2-hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "ros2_control hardware plugins for the MOTKIN dual motor testbed.
    FiveBarSystem wraps the hardware plugin driving motor_1/motor_2 and
    exports the five-bar passive joints as state-only interfaces, computed
    from the motor encoders with the exact direct geometric model.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

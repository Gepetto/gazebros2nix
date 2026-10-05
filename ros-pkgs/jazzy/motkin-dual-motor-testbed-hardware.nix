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

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-hardware";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    rev = "b908e007ad56de145dc8eb2507ee1e5d1f82fc79";
    hash = "sha256-Bg7q+sILOjrFzTZ7VQ58yysFfNj89nV2RZiTRsZn8Cg=";
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
  ];
  nativeCheckInputs = [
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

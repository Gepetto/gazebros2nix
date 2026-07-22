{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  control-msgs,
  control-toolbox,
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-action,
  realtime-tools,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-parallel-gripper-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/parallel_gripper_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    control-msgs
    control-toolbox
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-action
    realtime-tools
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    control-toolbox
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-action
    realtime-tools
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "The parallel_gripper_controller package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

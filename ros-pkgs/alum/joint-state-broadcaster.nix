{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  generate-parameter-library,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  sensor-msgs,
  urdf,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface,
  hardware-interface-testing,
  ros2-control-test-assets,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-alum-joint-state-broadcaster";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/joint_state_broadcaster";

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
    builtin-interfaces
    control-msgs
    controller-interface
    generate-parameter-library
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    sensor-msgs
    urdf
  ];
  propagatedBuildInputs = [
    backward-ros
    builtin-interfaces
    control-msgs
    controller-interface
    generate-parameter-library
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    sensor-msgs
    urdf
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface
    hardware-interface-testing
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "Broadcaster to publish joint state";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

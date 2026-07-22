{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  angles,
  backward-ros,
  control-msgs,
  control-toolbox,
  controller-interface,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  kinematics-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-kdl,
  tf2-ros,
  tinyxml-2,
  trajectory-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface-testing,
  kinematics-interface-kdl,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-admittance-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/admittance_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    angles
    backward-ros
    control-msgs
    control-toolbox
    controller-interface
    generate-parameter-library
    geometry-msgs
    hardware-interface
    kinematics-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
    tf2
    tf2-eigen
    tf2-geometry-msgs
    tf2-kdl
    tf2-ros
    tinyxml-2
    trajectory-msgs
  ];
  propagatedBuildInputs = [
    angles
    backward-ros
    control-msgs
    control-toolbox
    controller-interface
    generate-parameter-library
    geometry-msgs
    hardware-interface
    kinematics-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    tf2
    tf2-eigen
    tf2-geometry-msgs
    tf2-kdl
    tf2-ros
    tinyxml-2
    trajectory-msgs
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface-testing
    kinematics-interface-kdl
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Implementation of admittance controllers for different input and output interface.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

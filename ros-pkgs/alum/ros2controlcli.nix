{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  control-msgs,
  controller-manager,
  controller-manager-msgs,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,

  # propagatedBuildInputs
  lifecycle-msgs,
  python3Packages,
  ros2topic,
  rosidl-runtime-py,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros2controlcli";
  version = "4.49.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-wb3s95kNsBvMB3eT1NeuUEnjg612k13nkC4BqZ1h7K4=";
  };
  sourceRoot = "source/ros2controlcli";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    control-msgs
    controller-manager
    controller-manager-msgs
    rcl-interfaces
    rclpy
    ros2cli
    ros2node
  ];
  propagatedBuildInputs = [
    control-msgs
    controller-manager
    controller-manager-msgs
    lifecycle-msgs
    python3Packages.graphviz
    rcl-interfaces
    rclpy
    ros2cli
    ros2node
    ros2topic
    rosidl-runtime-py
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "The ROS 2 command line tools for ros2_control.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

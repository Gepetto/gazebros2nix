{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs

  # buildInputs
  controller-manager,
  controller-manager-msgs,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,

  # propagatedBuildInputs
  python3Packages,
  rosidl-runtime-py,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros2controlcli";
  version = "4.46.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-e0Y8CCl8/B80fLOXOePbjn1QRxFEi60W2IGTBhM2Qg4=";
  };
  sourceRoot = "source/ros2controlcli";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_python";

  nativeBuildInputs = [
  ];
  buildInputs = [
    controller-manager
    controller-manager-msgs
    rcl-interfaces
    rclpy
    ros2cli
    ros2node
    ros2param
  ];
  propagatedBuildInputs = [
    controller-manager
    controller-manager-msgs
    python3Packages.pygraphviz
    rcl-interfaces
    rclpy
    ros2cli
    ros2node
    ros2param
    rosidl-runtime-py
  ];
  checkInputs = [
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

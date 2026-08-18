{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  eigen,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  pluginlib,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-kinematics-interface";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "kinematics_interface";
    tag = version;
    hash = "sha256-T5hUz7aX6ZGRvZjo1kkNhzjUGq+JufFNXBNeLFthjo4=";
  };
  sourceRoot = "source/kinematics_interface";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    eigen
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    backward-ros
    eigen
    rclcpp
    rclcpp-lifecycle
  ];
  checkInputs = [
    ament-cmake-gmock
    pluginlib
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Kinematics interface for ROS 2 control";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/kinematics_interface";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

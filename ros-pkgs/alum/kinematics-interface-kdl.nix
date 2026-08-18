{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  eigen3-cmake-module,

  # buildInputs
  backward-ros,
  eigen,
  kdl-parser,
  kinematics-interface,
  pluginlib,
  ros2-control-cmake,
  tf2-eigen-kdl,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-kinematics-interface-kdl";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "kinematics_interface";
    tag = version;
    hash = "sha256-T5hUz7aX6ZGRvZjo1kkNhzjUGq+JufFNXBNeLFthjo4=";
  };
  sourceRoot = "source/kinematics_interface_kdl";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    eigen3-cmake-module
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    eigen
    eigen3-cmake-module
    kdl-parser
    kinematics-interface
    pluginlib
    ros2-control-cmake
    tf2-eigen-kdl
  ];
  propagatedBuildInputs = [
    backward-ros
    eigen
    kdl-parser
    kinematics-interface
    pluginlib
    tf2-eigen-kdl
  ];
  checkInputs = [
    ament-cmake-gmock
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "KDL implementation of ros2_control kinematics interface";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/kinematics_interface";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

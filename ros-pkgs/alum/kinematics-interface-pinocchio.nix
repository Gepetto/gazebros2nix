{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  eigen3-cmake-module,

  # buildInputs
  eigen,
  kinematics-interface,
  pinocchio,
  pluginlib,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-kinematics-interface-pinocchio";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "kinematics_interface";
    tag = version;
    hash = "sha256-T5hUz7aX6ZGRvZjo1kkNhzjUGq+JufFNXBNeLFthjo4=";
  };
  sourceRoot = "source/kinematics_interface_pinocchio";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    eigen3-cmake-module
  ];
  buildInputs = [
    ament-cmake
    eigen
    eigen3-cmake-module
    kinematics-interface
    pinocchio
    pluginlib
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    eigen
    eigen3-cmake-module
    kinematics-interface
    pinocchio
    pluginlib
  ];
  checkInputs = [
    ament-cmake-gmock
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Pinocchio-based implementation of ros2_control kinematics interface";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/kinematics_interface";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

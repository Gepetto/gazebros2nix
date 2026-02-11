{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-bringup,
  agimus-franka-description,
  agimus-franka-example-controllers,
  agimus-franka-fr3-moveit-config,
  agimus-franka-gazebo-bringup,
  agimus-franka-gripper,
  agimus-franka-hardware,
  agimus-franka-ign-ros2-control,
  agimus-franka-msgs,
  agimus-libfranka,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-ros2";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "9dcef3a781458c65209b5b92f9be7ce1f1f72bfb";
    hash = "sha256-TsYvxsfGato6K3aJtnNzKhhzAmr+2vf3WDasI06V9iA=";
  };
  sourceRoot = "source/franka_ros2";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-bringup
    agimus-franka-description
    agimus-franka-example-controllers
    agimus-franka-fr3-moveit-config
    agimus-franka-gazebo-bringup
    agimus-franka-gripper
    agimus-franka-hardware
    agimus-franka-ign-ros2-control
    agimus-franka-msgs
    agimus-libfranka
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_ros2 for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

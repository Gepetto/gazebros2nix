{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  agimus-franka-description,
  agimus-franka-gripper,
  agimus-franka-hardware,
  controller-manager,
  joint-state-broadcaster,
  joint-state-publisher,
  joint-trajectory-controller,
  moveit-kinematics,
  moveit-planners-ompl,
  moveit-ros-move-group,
  moveit-ros-visualization,
  moveit-simple-controller-manager,
  robot-state-publisher,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-fr3-moveit-config";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "9dcef3a781458c65209b5b92f9be7ce1f1f72bfb";
    hash = "sha256-TsYvxsfGato6K3aJtnNzKhhzAmr+2vf3WDasI06V9iA=";
  };
  sourceRoot = "source/franka_fr3_moveit_config";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-gripper
    agimus-franka-hardware
    controller-manager
    joint-state-broadcaster
    joint-state-publisher
    joint-trajectory-controller
    moveit-kinematics
    moveit-planners-ompl
    moveit-ros-move-group
    moveit-ros-visualization
    moveit-simple-controller-manager
    robot-state-publisher
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_fr3_moveit_config for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

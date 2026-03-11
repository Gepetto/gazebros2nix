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
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-fr3-moveit-config";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "40e3f6073cf4cb2e6a990dba367207bdccc7ffeb";
    hash = "sha256-eZpLyhPiGmxFkS5/zlri4wxL2riTUpf2DR5vUaoAIEU=";
  };
  sourceRoot = "source/agimus_franka_fr3_moveit_config";

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
    ament-lint-common
  ];

  doCheck = true;

  meta = {
    description = "fork of agimus_franka_fr3_moveit_config for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

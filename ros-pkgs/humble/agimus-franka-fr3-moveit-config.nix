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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-fr3-moveit-config";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "927a0393961fb4b27c9d1e5815955e132b7bf3b3";
    hash = "sha256-nVPTHD6i5i+UfAXnyCPe29OmdCnWJw5dlDKGu0CjghU=";
  };
  sourceRoot = "source/agimus_franka_fr3_moveit_config";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
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
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_fr3_moveit_config for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

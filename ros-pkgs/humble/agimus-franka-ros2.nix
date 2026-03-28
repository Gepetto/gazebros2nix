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
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-ros2";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "927a0393961fb4b27c9d1e5815955e132b7bf3b3";
    hash = "sha256-nVPTHD6i5i+UfAXnyCPe29OmdCnWJw5dlDKGu0CjghU=";
  };
  sourceRoot = "source/agimus_franka_ros2";

  __structuredAttrs = true;
  strictDeps = true;

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
    ament-cmake
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_ros2 for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

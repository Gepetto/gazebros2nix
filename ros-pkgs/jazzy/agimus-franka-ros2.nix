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
  agimus-franka-gripper,
  agimus-franka-hardware,
  agimus-franka-msgs,
  agimus-libfranka,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-franka-ros2";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "2719804b4ed7b2d4ef12d8ae4be34e0a5e1ac5cc";
    hash = "sha256-J5ebhKVkF3m/0RcRFXv+UTqLjRAQBhbpajrVsl+z1oo=";
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
    agimus-franka-gripper
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-libfranka
    ament-cmake
  ];
  propagatedBuildInputs = [
    agimus-franka-bringup
    agimus-franka-description
    agimus-franka-example-controllers
    agimus-franka-fr3-moveit-config
    agimus-franka-gripper
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-libfranka
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

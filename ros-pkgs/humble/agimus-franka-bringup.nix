{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  agimus-franka-description,
  agimus-franka-hardware,
  agimus-franka-robot-state-broadcaster,
  controller-manager,
  joint-state-broadcaster,
  joint-state-publisher,
  robot-state-publisher,
  rviz2,
  xacro,

  # checkInputs
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "be2d4c91d57c08889bfbeda037658f9bc25c149d";
    hash = "sha256-gFmqCvtZ8ICcQ3CPCWMFSr7m5Z6qSvxkDPtg99CBjLI=";
  };
  sourceRoot = "source/agimus_franka_bringup";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-hardware
    agimus-franka-robot-state-broadcaster
    controller-manager
    joint-state-broadcaster
    joint-state-publisher
    robot-state-publisher
    rviz2
    xacro
  ];
  checkInputs = [
    ament-lint-common
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_bringup for franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

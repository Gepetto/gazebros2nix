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
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "dac0a450f2e194daa5d30fbe74b851673991f5a1";
    hash = "sha256-BGPTtIbayOO/W0ByOI6yK5HLBtWciwq+FirG4JfK4Eo=";
  };
  sourceRoot = "source/franka_bringup";

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
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_bringup for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  launch-pal,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  moveit-task-constructor-capabilities,
  pal-sea-arm-moveit-config,
  tiago-pro-description,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-moveit-config";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_moveit_config";
    tag = version;
    hash = "sha256-aAnR+3y6MXhZy4rKtLMFWvX3kCus/cBAXVmTKI5XVqw=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch-pal
    moveit-configs-utils
    moveit-kinematics
    moveit-planners-chomp
    moveit-planners-ompl
    moveit-ros-control-interface
    moveit-ros-move-group
    moveit-ros-perception
    moveit-ros-visualization
    moveit-task-constructor-capabilities
    pal-sea-arm-moveit-config
    tiago-pro-description
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];

  doCheck = false;

  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the tiago_pro with the MoveIt! Motion Planning Framework";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_moveit_config";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

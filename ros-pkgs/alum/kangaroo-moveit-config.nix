{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  kangaroo-description,
  launch-pal,
  moveit-configs-utils,
  moveit-kinematics,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-ros-control-interface,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-visualization,
  pal-sea-arm-moveit-config,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-kangaroo-moveit-config";
  version = "2.2.2";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_moveit_config";
    tag = version;
    hash = "sha256-x2sbNLiJR3dNoF3vLWj31xqz+yrSXgMssJCcBj12Wjc=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    kangaroo-description
    launch-pal
    moveit-configs-utils
    moveit-kinematics
    moveit-planners-chomp
    moveit-planners-ompl
    moveit-ros-control-interface
    moveit-ros-move-group
    moveit-ros-perception
    moveit-ros-visualization
    pal-sea-arm-moveit-config
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the kangaroo with the MoveIt! Motion Planning Framework";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_moveit_config";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

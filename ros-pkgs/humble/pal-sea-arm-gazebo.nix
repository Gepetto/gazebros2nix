{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  gz-ros2-control,
  gz-sensors6,
  launch,
  launch-pal,
  launch-ros,
  pal-gazebo-plugins,
  pal-gazebo-worlds,
  pal-pro-gripper-description,
  pal-sea-arm-bringup,
  pal-sea-arm-description,
  pal-sea-arm-moveit-config,
  pal-urdf-utils,
  ros-gz-bridge,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm-gazebo";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm_simulation";
    tag = version;
    hash = "sha256-YBRNs2GhWgBsro0sSWW9Hk6Ckmlda+evfV2IwtYuY3g=";
  };
  sourceRoot = "source/pal_sea_arm_gazebo";

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
    gazebo-plugins
    gazebo-ros
    gazebo-ros2-control
    gz-ros2-control
    gz-sensors6
    launch
    launch-pal
    launch-ros
    pal-gazebo-plugins
    pal-gazebo-worlds
    pal-pro-gripper-description
    pal-sea-arm-bringup
    pal-sea-arm-description
    pal-sea-arm-moveit-config
    pal-urdf-utils
    ros-gz-bridge
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The pal_sea_arm_gazebo package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_sea_arm_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

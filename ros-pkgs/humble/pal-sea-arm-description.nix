{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  joint-state-publisher-gui,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  pal-pro-gripper-description,
  pal-sea-arm-controller-configuration,
  pal-urdf-utils,
  robot-state-publisher,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm-description";
  version = "1.23.2";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm";
    tag = version;
    hash = "sha256-8/N+vUzZFULRbKwE3nuqe4JDJ5O9KAM2jrQIPzkmVN0=";
  };
  sourceRoot = "source/pal_sea_arm_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    joint-state-publisher-gui
    launch
    launch-pal
    launch-param-builder
    launch-ros
    pal-pro-gripper-description
    pal-sea-arm-controller-configuration
    pal-urdf-utils
    robot-state-publisher
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    urdf-test
  ];

  doCheck = false;

  meta = {
    description = "The pal_sea_arm_description package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/pal_sea_arm";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

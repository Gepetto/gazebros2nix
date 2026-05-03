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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-pal-sea-arm-description";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "pal_sea_arm";
    tag = version;
    hash = "sha256-YRBsyTfPRW1U8Va9JRE5kCRKH5ok/f3gMFQ1kG2HDTw=";
  };
  sourceRoot = "source/pal_sea_arm_description";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
    ament-cmake-auto
    ament-cmake-python
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
  nativeCheckInputs = [
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

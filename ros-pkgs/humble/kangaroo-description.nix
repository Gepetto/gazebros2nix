{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  rcl-interfaces,
  rclcpp,

  # propagatedBuildInputs
  kangaroo-controller-configuration,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  pal-sea-arm-description,
  pal-urdf-utils,
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
  pname = "ros-humble-kangaroo-description";
  version = "2.13.2";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_robot";
    tag = version;
    hash = "sha256-FeNxJSm840h/vULyYyGL00csbXzXl3wMK7fW5ccQ6MY=";
  };
  sourceRoot = "source/kangaroo_description";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
    rcl-interfaces
    rclcpp
  ];
  propagatedBuildInputs = [
    kangaroo-controller-configuration
    launch
    launch-pal
    launch-param-builder
    launch-ros
    pal-sea-arm-description
    pal-urdf-utils
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

  doCheck = true;

  meta = {
    description = "The kangaroo_description package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

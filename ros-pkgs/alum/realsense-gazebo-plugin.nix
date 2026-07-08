{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  camera-info-manager,
  gazebo-ros,
  image-transport,
  point-cloud-transport,
  rclcpp,
  sensor-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-uncrustify,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-alum-realsense-gazebo-plugin";
  version = "3.2.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "realsense_gazebo_plugin";
    tag = version;
    hash = "sha256-CPXmGao8reIUi1dH5PY5VFFXqHNzZSKyZ4Mo+jjbCuY=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    camera-info-manager
    gazebo-ros
    image-transport
    point-cloud-transport
    rclcpp
    sensor-msgs
  ];
  propagatedBuildInputs = [
    camera-info-manager
    gazebo-ros
    image-transport
    point-cloud-transport
    rclcpp
    sensor-msgs
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "Intel RealSense D435 Gazebo plugin package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/realsense_gazebo_plugin";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  pkg-config,

  # buildInputs
  gz-msgs-vendor,
  gz-transport-vendor,
  image-transport,
  rclcpp,
  ros-gz-bridge,
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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros-gz-image";
  version = "1.0.23";

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "ros_gz";
    tag = version;
    hash = "sha256-hliXefmoiD/RU/MXyEIQo4XulT7I4NBu+QxOPjkSni0=";
  };
  sourceRoot = "source/ros_gz_image";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    pkg-config
  ];
  buildInputs = [
    ament-cmake
    gz-msgs-vendor
    gz-transport-vendor
    image-transport
    rclcpp
    ros-gz-bridge
    sensor-msgs
  ];
  propagatedBuildInputs = [
    gz-msgs-vendor
    gz-transport-vendor
    image-transport
    rclcpp
    ros-gz-bridge
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
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/ros_gz";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

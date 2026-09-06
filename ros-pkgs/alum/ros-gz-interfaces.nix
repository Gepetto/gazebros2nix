{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosidl-default-generators,

  # buildInputs
  builtin-interfaces,
  geometry-msgs,
  rcl-interfaces,
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
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
  pname = "ros-alum-ros-gz-interfaces";
  version = "1.0.24";

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "ros_gz";
    tag = version;
    hash = "sha256-DxB2eXnNwMuglUX8gQ+n/RvkQ2DAy/GJcFJpWpdJtTY=";
  };
  sourceRoot = "source/ros_gz_interfaces";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosidl-default-generators
  ];
  buildInputs = [
    ament-cmake
    builtin-interfaces
    geometry-msgs
    rcl-interfaces
    rosidl-default-generators
    std-msgs
  ];
  propagatedBuildInputs = [
    builtin-interfaces
    geometry-msgs
    rcl-interfaces
    rosidl-default-runtime
    std-msgs
  ];
  checkInputs = [
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
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/ros_gz";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

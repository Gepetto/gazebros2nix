{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-hardware,
  agimus-franka-msgs,
  agimus-libfranka,
  controller-interface,
  eigen,
  geometry-msgs,
  hardware-interface,
  rclcpp,
  sensor-msgs,
  urdf,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-lint-cmake,
  ament-pep257,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-semantic-components";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "866f340d2fc2216da00e89f3adf52720cc3dc1ad";
    hash = "sha256-jx4c1mJa9/pXsa+/ZhALftmLWEwcvDr3k4eS3h+tQ7Q=";
  };
  sourceRoot = "source/agimus_franka_semantic_components";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-libfranka
    ament-cmake
    controller-interface
    eigen
    geometry-msgs
    hardware-interface
    rclcpp
    sensor-msgs
    urdf
  ];
  propagatedBuildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-libfranka
    controller-interface
    geometry-msgs
    hardware-interface
    rclcpp
    sensor-msgs
    urdf
  ];
  checkInputs = [
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-lint-cmake
    ament-pep257
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_semantic_components for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

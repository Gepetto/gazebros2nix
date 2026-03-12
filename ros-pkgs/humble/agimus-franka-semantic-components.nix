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
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  xmllintPackageHook,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-semantic-components";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "1f75782e408473dcdeca577522e0e26300ed3c41";
    hash = "sha256-sDahBYOj1w1SfIKqbQR/DZKvztq2BPumEuryNCw43XY=";
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
    controller-interface
    eigen
    geometry-msgs
    hardware-interface
    rclcpp
    sensor-msgs
    urdf
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    xmllintPackageHook
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

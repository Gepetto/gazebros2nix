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
  agimus-libfranka-common,
  controller-interface,
  eigen,
  geometry-msgs,
  hardware-interface,
  rclcpp,
  sensor-msgs,
  urdf,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-semantic-components";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "b4450db350c8ea796eef77290e81b09654f766bb";
    hash = "sha256-HRQJ9gx184+9+3GIfRnDcUuTMj/K8D/Ps2Ygje6OZdk=";
  };
  sourceRoot = "source/franka_semantic_components";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-hardware
    agimus-franka-msgs
    agimus-libfranka
    agimus-libfranka-common
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
    ament-cmake-clang-format
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_semantic_components for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

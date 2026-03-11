{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  agimus-franka-msgs,
  agimus-libfranka,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-components,

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
  rmw-implementation-cmake,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-hardware";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "40e3f6073cf4cb2e6a990dba367207bdccc7ffeb";
    hash = "sha256-eZpLyhPiGmxFkS5/zlri4wxL2riTUpf2DR5vUaoAIEU=";
  };
  sourceRoot = "source/agimus_franka_hardware";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    agimus-franka-msgs
    agimus-libfranka
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-action
    rclcpp-components
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
    rmw-implementation-cmake
  ];

  doCheck = true;

  meta = {
    description = "fork of agimus_franka_hardware for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

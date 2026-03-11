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
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  rmw-implementation-cmake,
  xmllintPackageHook,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-hardware";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "ebf734c0dfa09b0fc29cde12b678fed4a099f0db";
    hash = "sha256-O+xQSbQsqCSVXhj9bcfgJjIgySt7nvNJjLCft6I5TRY=";
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
    ament-cmake-clang-tidy
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-gmock
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    rmw-implementation-cmake
    xmllintPackageHook
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_hardware for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

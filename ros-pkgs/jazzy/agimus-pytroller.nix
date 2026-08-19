{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-auto,

  # buildInputs
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  pybind11-vendor,
  python3,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-pytroller";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_pytroller";
    rev = "edfae01d112fe83fe380ed103869dbd6938d4c12";
    hash = "sha256-FMBV5MUJxot7pOrW6Fz3tij4RjQa1toFRLwjDBJdxeg=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-auto
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-auto
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    pybind11-vendor
    python3
    rclcpp
    rclcpp-lifecycle
    realtime-tools
  ];
  propagatedBuildInputs = [
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Python ros2_controller for Agimus.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_pytroller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

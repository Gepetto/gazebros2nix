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
  pname = "ros-humble-agimus-pytroller";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_pytroller";
    rev = "c4481fe85553115ca7030a19bb447fad626bf26a";
    hash = "sha256-YorDSRdhf85GqITJN+TDHMfdQ0yl2Ka0FXiUi4Zrcpw=";
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

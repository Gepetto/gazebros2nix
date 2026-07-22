{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  control-msgs,
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-gmock,
  controller-manager,
  hardware-interface-testing,
  ros2-control-test-assets,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gpio-controllers";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/gpio_controllers";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    control-msgs
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    ros2-control-cmake
  ];
  propagatedBuildInputs = [
    control-msgs
    controller-interface
    generate-parameter-library
    hardware-interface
    rclcpp
    rclcpp-lifecycle
    realtime-tools
  ];
  checkInputs = [
    ament-cmake-gmock
    controller-manager
    hardware-interface-testing
    ros2-control-test-assets
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Controllers to interact with gpios.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

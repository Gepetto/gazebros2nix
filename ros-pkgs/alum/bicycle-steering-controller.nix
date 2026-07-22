{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  control-msgs,
  controller-interface,
  generate-parameter-library,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros2-control-cmake,
  std-srvs,
  steering-controllers-library,

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
  pname = "ros-alum-bicycle-steering-controller";
  version = "4.41.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_controllers";
    tag = version;
    hash = "sha256-+JDFzCLyZ3UAC/DTd/LBVLf+OnrDvzaFcZaxHTFwbr4=";
  };
  sourceRoot = "source/bicycle_steering_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    backward-ros
    control-msgs
    controller-interface
    generate-parameter-library
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    ros2-control-cmake
    std-srvs
    steering-controllers-library
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    controller-interface
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    std-srvs
    steering-controllers-library
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
    description = "Steering controller with bicycle kinematics. Rear fixed wheel is powering the vehicle and front wheel is steering.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_controllers";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

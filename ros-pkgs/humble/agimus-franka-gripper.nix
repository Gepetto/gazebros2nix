{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-python,

  # buildInputs
  agimus-franka-msgs,
  agimus-libfranka,
  control-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclpy,
  sensor-msgs,
  std-srvs,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-clang-format,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-gripper";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_ros2";
    rev = "9dcef3a781458c65209b5b92f9be7ce1f1f72bfb";
    hash = "sha256-TsYvxsfGato6K3aJtnNzKhhzAmr+2vf3WDasI06V9iA=";
  };
  sourceRoot = "source/franka_gripper";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
  ];
  buildInputs = [
    agimus-franka-msgs
    agimus-libfranka
    control-msgs
    rclcpp
    rclcpp-action
    rclcpp-components
    rclpy
    sensor-msgs
    std-srvs
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    ament-cmake-clang-format
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_gripper for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

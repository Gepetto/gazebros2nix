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
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-franka-gripper";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "927a0393961fb4b27c9d1e5815955e132b7bf3b3";
    hash = "sha256-nVPTHD6i5i+UfAXnyCPe29OmdCnWJw5dlDKGu0CjghU=";
  };
  sourceRoot = "source/agimus_franka_gripper";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-python
  ];
  buildInputs = [
    agimus-franka-msgs
    agimus-libfranka
    ament-cmake
    ament-cmake-python
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
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_gripper for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

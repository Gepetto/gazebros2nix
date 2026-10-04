{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-interface,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-uncrustify,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-five-bar-force-velocity-controller";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "8869d16e271536089e7ba288217b0ff514614113";
    hash = "sha256-i2gpZkyHXvELIeQbHyONA58sotpB07qKROD3LRH4C64=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_controllers/odri_five_bar_force_velocity_controller";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    generate-parameter-library
    geometry-msgs
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
  ];
  propagatedBuildInputs = [
    controller-interface
    generate-parameter-library
    geometry-msgs
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
  ];
  checkInputs = [
    ament-cmake-gmock
    ament-lint-auto
    ament-lint-common
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "ros2_control endpoint force-to-velocity controller (qdot = J^T f_c) for
    the odri_dual_motor_testbed five-bar mechanism. Reads motor_1/motor_2
    position state interfaces, reads a contact force from a
    geometry_msgs/WrenchStamped topic, and commands qdot = J^T f_c as a
    velocity setpoint using an analytical (closed-form) Jacobian derived
    from the URDF geometry -- no Pinocchio or other rigid-body library
    involved.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

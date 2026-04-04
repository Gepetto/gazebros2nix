{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs
  control-toolbox,
  controller-interface,
  eigen,
  fmt,
  generate-parameter-library,
  hardware-interface,
  jrl-cmakemodules,
  linear-feedback-controller-msgs,
  message-filters,
  nav-msgs,
  pal-statistics,
  parameter-traits,
  pinocchio,
  pluginlib,
  rcl,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  rosidl-dynamic-typesupport,
  sensor-msgs,

  # propagatedBuildInputs

  # checkInputs
  ament-lint-auto,
  gmock-vendor,
  gtest-vendor,

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-linear-feedback-controller";
  version = "3.1.0";

  src = fetchFromGitHub {
    owner = "loco-3d";
    repo = "linear-feedback-controller";
    tag = "v${version}";
    hash = "sha256-fMklYwoRlKVNdWJmuqw9MaEA9NWjFNBdf+j0OMJ5HD0=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
    generate-parameter-library
  ];
  buildInputs = [
    ament-cmake-auto
    ament-cmake-python
    control-toolbox
    controller-interface
    eigen
    fmt
    generate-parameter-library
    hardware-interface
    jrl-cmakemodules
    linear-feedback-controller-msgs
    message-filters
    nav-msgs
    pal-statistics
    parameter-traits
    pinocchio
    pluginlib
    rcl
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    rosidl-dynamic-typesupport
    sensor-msgs
  ];
  propagatedBuildInputs = [
    control-toolbox
    controller-interface
    eigen
    generate-parameter-library
    hardware-interface
    linear-feedback-controller-msgs
    message-filters
    nav-msgs
    pal-statistics
    pinocchio
    pluginlib
    rcl
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    rosidl-dynamic-typesupport
    sensor-msgs
  ];
  checkInputs = [
    ament-lint-auto
    gmock-vendor
    gtest-vendor
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "roscontrol controller package conputing a linear feedback. The user needs
    to provide a model of the robot and a list of controlled joint and the
    controller computes a linear feedback on the user defined state.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/loco-3d/linear-feedback-controller";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

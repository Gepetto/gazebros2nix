{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  backward-ros,
  control-msgs,
  eigen,
  filters,
  generate-parameter-library,
  geometry-msgs,
  pluginlib,
  rclcpp,
  rcutils,
  realtime-tools,
  ros2-control-cmake,
  rsl,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tl-expected-nixpkgs,

  # propagatedBuildInputs
  fmt,

  # checkInputs
  ament-cmake-gmock,
  rclcpp-lifecycle,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-control-toolbox";
  version = "4.11.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "control_toolbox";
    tag = version;
    hash = "sha256-q1h1hcE8/7kChj5mWL6Zvu7qoyrEWHcXdnrhIC04SfY=";
  };
  sourceRoot = "source/control_toolbox";

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
    eigen
    filters
    generate-parameter-library
    geometry-msgs
    pluginlib
    rclcpp
    rcutils
    realtime-tools
    ros2-control-cmake
    rsl
    tf2
    tf2-geometry-msgs
    tf2-ros
    tl-expected-nixpkgs
  ];
  propagatedBuildInputs = [
    backward-ros
    control-msgs
    eigen
    filters
    fmt
    generate-parameter-library
    geometry-msgs
    pluginlib
    rclcpp
    rcutils
    realtime-tools
    rsl
    tf2
    tf2-geometry-msgs
    tf2-ros
    tl-expected-nixpkgs
  ];
  checkInputs = [
    ament-cmake-gmock
    rclcpp-lifecycle
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "The control toolbox contains modules that are useful across all controllers.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/control_toolbox";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

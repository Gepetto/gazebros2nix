{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  agimus-demos,
  controller-interface,
  eigen,
  generate-parameter-library,
  hardware-interface,
  pinocchio,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  std-msgs,
  std-srvs,

  # propagatedBuildInputs

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-demos-controllers";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "7fee3010b7112236c5cb7bc2592c1f3c16af676e";
    hash = "sha256-+ziFTYWWKrhyLwY3qlpltieePkbwCXN5ftd2i4rQ3lo=";
  };
  sourceRoot = "source/agimus_demos_controllers";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    generate-parameter-library
  ];
  buildInputs = [
    agimus-demos
    ament-cmake-auto
    controller-interface
    eigen
    generate-parameter-library
    hardware-interface
    pinocchio
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
    std-srvs
  ];
  propagatedBuildInputs = [
    agimus-demos
    controller-interface
    hardware-interface
    pinocchio
    pluginlib
    rclcpp
    rclcpp-lifecycle
    realtime-tools
    std-msgs
    std-srvs
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Implementations of ros2_control controllers used in Agimus demos.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

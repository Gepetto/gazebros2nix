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
  pname = "ros-rolling-agimus-demos-controllers";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "8bb84651288dca5bd786bff7c26b913fbac5d850";
    hash = "sha256-jEyOUZB7nYR/32gPkibsTkm90oppGVS5L3OYLOFLBBs=";
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

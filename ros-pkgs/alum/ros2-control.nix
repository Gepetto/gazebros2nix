{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  controller-interface,
  controller-manager,
  controller-manager-msgs,
  hardware-interface,
  joint-limits,
  ros2-control-test-assets,
  ros2controlcli,
  transmission-interface,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-ros2-control";
  version = "4.47.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control";
    tag = version;
    hash = "sha256-orjAU4K/bbbn62u7VXRDU99/HYkegVbFwDXSrvFZhY0=";
  };
  sourceRoot = "source/ros2_control";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
    controller-interface
    controller-manager
    controller-manager-msgs
    hardware-interface
    joint-limits
    ros2-control-test-assets
    ros2controlcli
    transmission-interface
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Metapackage for ROS2 control related packages";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

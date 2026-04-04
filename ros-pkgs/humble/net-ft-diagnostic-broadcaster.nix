{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-interface,
  diagnostic-msgs,
  diagnostic-updater,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,

  # propagatedBuildInputs

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-net-ft-diagnostic-broadcaster";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "gbartyzel";
    repo = "ros2_net_ft_driver";
    tag = "v${version}";
    hash = "sha256-0gTNXhQiWwHNozPVgHz3wbh74RfkKDgceIHByk77Dcc=";
  };
  sourceRoot = "source/net_ft_diagnostic_broadcaster";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    controller-interface
    diagnostic-msgs
    diagnostic-updater
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  propagatedBuildInputs = [
    controller-interface
    diagnostic-msgs
    diagnostic-updater
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Provides broadcaster for diagnostic data of the F/T sensor";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gbartyzel/ros2_net_ft_driver";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

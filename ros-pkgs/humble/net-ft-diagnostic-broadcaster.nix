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
}:
buildRosPackage rec {
  pname = "ros-humble-net-ft-diagnostic-broadcaster";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "gbartyzel";
    repo = "ros2_net_ft_driver";
    tag = version;
    hash = "sha256-TbTs7PmP98WyCIslfgdh+TLHi8jZZXgjEiHoFnIQXZw=";
  };
  sourceRoot = "source/net_ft_diagnostic_broadcaster";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    controller-interface
    diagnostic-msgs
    diagnostic-updater
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
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

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  pkg-config,

  # buildInputs
  asio,
  asio-cmake-module,
  hardware-interface,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  tinyxml-2,

  # propagatedBuildInputs
  curl,
  curlpp,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-net-ft-driver";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "gbartyzel";
    repo = "ros2_net_ft_driver";
    tag = "v${version}";
    hash = "sha256-0gTNXhQiWwHNozPVgHz3wbh74RfkKDgceIHByk77Dcc=";
  };
  sourceRoot = "source/net_ft_driver";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    pkg-config
  ];
  buildInputs = [
    asio
    asio-cmake-module
    hardware-interface
    pluginlib
    rclcpp
    rclcpp-lifecycle
    tinyxml-2
  ];
  propagatedBuildInputs = [
    curl
    curlpp
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "ROS2 driver for Net F/T sensors (ATI, ATI Axia, OnRobot)";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gbartyzel/ros2_net_ft_driver";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

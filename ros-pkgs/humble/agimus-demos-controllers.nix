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
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-demos-controllers";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "29b88ff791fed647cb7cf1c61522a06919ddc9a1";
    hash = "sha256-ftgLbwij0dh3Pgi8xG+cGHJ1cIVC3xlGJzjCsQhg38g=";
  };
  sourceRoot = "source/agimus_demos_controllers";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    agimus-demos
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

  doCheck = true;

  meta = {
    description = "Implementations of ros2_control controllers used in Agimus demos.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

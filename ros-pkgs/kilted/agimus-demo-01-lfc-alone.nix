{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs
  control-toolbox,
  controller-interface,
  eigen3-cmake-module,
  hardware-interface,
  linear-feedback-controller,
  linear-feedback-controller-msgs,
  message-filters,
  nav-msgs,
  pal-statistics,
  pinocchio,
  pluginlib,
  realtime-tools,
  tf2-eigen,

  # propagatedBuildInputs
  ros2launch,

  # checkInputs
  ament-lint-auto,
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-demo-01-lfc-alone";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "40c897103f651d07bca480dd2a4b5a73270fb454";
    hash = "sha256-IIsTWCocu65UatuQniHmlt8JBlAck/LXvXlZMURsgtg=";
  };
  sourceRoot = "source/agimus_demo_01_lfc_alone";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    control-toolbox
    controller-interface
    eigen3-cmake-module
    hardware-interface
    linear-feedback-controller
    linear-feedback-controller-msgs
    message-filters
    nav-msgs
    pal-statistics
    pinocchio
    pluginlib
    realtime-tools
    tf2-eigen
  ];
  propagatedBuildInputs = [
    ros2launch
  ];
  checkInputs = [
    ament-lint-auto
  ];

  doCheck = true;

  meta = {
    description = "agimus_demo_01_lfc_alone contains the entry points for a simple Panda demo with the LFC";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

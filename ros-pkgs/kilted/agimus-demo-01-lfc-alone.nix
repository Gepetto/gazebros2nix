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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-demo-01-lfc-alone";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "35e6dff44a08baa39125b006659c0e48c450c657";
    hash = "sha256-zcS8UK8MW3K6EBTwoy6zekp1KDTHGOKvJqm+OTOOUMQ=";
  };
  sourceRoot = "source/agimus_demo_01_lfc_alone";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
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
    ros2launch
    tf2-eigen
  ];
  checkInputs = [
    ament-lint-auto
  ];
  nativeCheckInputs = [
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

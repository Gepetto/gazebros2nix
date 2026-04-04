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
  pname = "ros-rolling-agimus-demo-01-lfc-alone";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-demos";
    rev = "7fee3010b7112236c5cb7bc2592c1f3c16af676e";
    hash = "sha256-+ziFTYWWKrhyLwY3qlpltieePkbwCXN5ftd2i4rQ3lo=";
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

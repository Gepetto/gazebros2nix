{
  lib,
  stdenv,

  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  fmt,
  python3Packages,
  ament-cmake,
  ament-cmake-auto,
  ament-lint-auto,
  eigen3-cmake-module,
  generate-parameter-library-py,
  pluginlib,

  # propagatedBuildInputs
  linear-feedback-controller-msgs,
  control-toolbox,
  controller-interface,
  nav-msgs,
  pal-statistics,
  parameter-traits,
  realtime-tools,
  rclcpp-lifecycle,

  # checkInputs
  gtest,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "linear-feedback-controller";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "loco-3d";
    repo = "linear-feedback-controller";
    tag = "v${finalAttrs.version}";
    hash = "sha256-WB0QXTY74jqeYIt+lv5Y9slMw6lx8FfHO26aGpoX7T0=";
  };

  nativeBuildInputs = [
    cmake
    fmt
    python3Packages.python
    ament-cmake
    ament-cmake-auto
    ament-lint-auto
    eigen3-cmake-module # this is a mistake on humble
    generate-parameter-library-py
    pluginlib
  ];

  propagatedBuildInputs = [
    fmt
    linear-feedback-controller-msgs
    python3Packages.pinocchio
    python3Packages.example-robot-data
    control-toolbox
    controller-interface
    nav-msgs
    pal-statistics
    parameter-traits
    realtime-tools
    rclcpp-lifecycle
  ];

  checkInputs = [
    gtest
  ];

  # revert https://github.com/lopsided98/nix-ros-overlay/blob/develop/distros/rosidl-generator-py-setup-hook.sh
  # as they break tests
  postConfigure = ''
    cmake $cmakeDir -DCMAKE_SKIP_BUILD_RPATH:BOOL=OFF
  '';

  doCheck = true;

  # generate_parameter_library_markdown complains that build/doc exists
  # ref. https://github.com/PickNikRobotics/generate_parameter_library/pull/212
  enableParallelBuilding = false;

  meta = {
    description = "RosControl linear feedback controller with pal base estimator and RosTopics external interface.";
    homepage = "https://github.com/loco-3d/linear-feedback-controller";
    license = lib.licenses.bsd2;
    maintainers = [ lib.maintainers.nim65s ];
    platforms = lib.platforms.linux;
  };
})

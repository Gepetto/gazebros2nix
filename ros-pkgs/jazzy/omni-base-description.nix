{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  gazebo-planar-move-plugin,
  joint-state-publisher-gui,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  pal-urdf-utils,
  realsense2-description,
  rviz2,
  xacro,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-jazzy-omni-base-description";
  version = "2.0.19";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "omni_base_robot";
    rev = "5a822f81fe06bd400c82533f728984c35ac163e2";
    hash = "sha256-B9x54Z2vDolwrUSJenn9Ep5qrpZsdLd49Q1Qeo2Wi9k=";
  };
  sourceRoot = "source/omni_base_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    gazebo-planar-move-plugin
    joint-state-publisher-gui
    launch
    launch-pal
    launch-param-builder
    launch-ros
    pal-urdf-utils
    realsense2-description
    rviz2
    xacro
  ];
  checkInputs = [
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    urdf-test
  ];

  doCheck = false;

  meta = {
    description = "This package contains the description (mechanical, kinematic, visual,
      etc.) of the omni_base robot.  The files in this package are parsed and used by
      a variety of other components.  Most users will not interact directly
      with this package.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

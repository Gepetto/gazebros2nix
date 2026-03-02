{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  joint-state-publisher-gui,
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  pal-urdf-utils,
  rviz2,
  xacro,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-jazzy-pmb2-description";
  version = "5.0.26";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "pmb2_robot";
    rev = "984ac253d667ef0757348eaefcbb4404d599e575";
    hash = "sha256-Wonz2lRRb09m2G4IInkAepTH9zvUyJQY0nC8WLtDUdk=";
  };
  sourceRoot = "source/pmb2_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    joint-state-publisher-gui
    launch
    launch-pal
    launch-param-builder
    launch-ros
    pal-urdf-utils
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
    description = "Mechanical, kinematic, visual, etc. description of the PMB2 robot.
      The files in this package are parsed and used by
      a variety of other components.  Most users will not interact directly
      with this package.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/pmb2_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

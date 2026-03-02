{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  launch,
  launch-pal,
  launch-param-builder,
  launch-ros,
  omni-base-description,
  pal-gripper-description,
  pal-hey5-description,
  pal-robotiq-description,
  pal-urdf-utils,
  pmb2-description,
  robot-state-publisher,
  xacro,

  # checkInputs
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-description";
  version = "4.2.20";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_robot";
    rev = "bc2ac55a0be2c49ccca6e09f6ff533902c9fb8e2";
    hash = "sha256-iaGv8DQAcI732xo/zBFs+7HOYdgtSc1/OaNK+mGWk4Y=";
  };
  sourceRoot = "source/tiago_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch
    launch-pal
    launch-param-builder
    launch-ros
    omni-base-description
    pal-gripper-description
    pal-hey5-description
    pal-robotiq-description
    pal-urdf-utils
    pmb2-description
    robot-state-publisher
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
      etc.) of the TIAGO robot.  The files in this package are parsed and used by
      a variety of other components.  Most users will not interact directly
      with this package.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

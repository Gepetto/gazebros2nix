{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  omni-base-description,
  pal-sea-arm-description,
  pal-urdf-utils,
  robot-state-publisher,
  tiago-pro-head-description,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-humble-tiago-pro-description";
  version = "1.35.3";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "tiago_pro_robot";
    tag = version;
    hash = "sha256-SIR9tIDNAn8hifFaClzDJBOjHIH5hUFcTtT1Kjht7D8=";
  };
  sourceRoot = "source/tiago_pro_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    omni-base-description
    pal-sea-arm-description
    pal-urdf-utils
    robot-state-publisher
    tiago-pro-head-description
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    urdf-test
  ];

  doCheck = false;

  meta = {
    description = "The tiago_pro_description package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

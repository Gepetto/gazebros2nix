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
  pname = "ros-jazzy-tiago-pro-description";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "d835dc4d99ba9e6614f5cd232eafc7c243d4c79c";
    hash = "sha256-NRnr88i8S4dFRy5pp4G5UiC/CPlwuhJoJdM6Q75KW3Y=";
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
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

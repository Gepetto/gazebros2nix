{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  launch-param-builder,
  pal-urdf-utils,
  realsense2-description,
  robot-state-publisher,
  tiago-pro-head-controller-configuration,
  xacro,

  # checkInputs
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-head-description";
  version = "1.9.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_head_robot";
    rev = "5db7298353d3c8932966c2ee5f45c475dfee1a93";
    hash = "sha256-L0nTo/kDG3zsj0TWNXNGGDmtU2BYJtEzSchEwJEYotY=";
  };
  sourceRoot = "source/tiago_pro_head_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    launch-param-builder
    pal-urdf-utils
    realsense2-description
    robot-state-publisher
    tiago-pro-head-controller-configuration
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    urdf-test
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro_head_description package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_head_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

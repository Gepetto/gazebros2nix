{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  agimus-franka-description,
  agimus-franka-hardware,
  agimus-franka-robot-state-broadcaster,
  controller-manager,
  joint-state-broadcaster,
  joint-state-publisher,
  robot-state-publisher,
  rviz2,
  xacro,

  # checkInputs
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-franka-bringup";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "562d6087298b13ece3d8ee42a0f410246753b31e";
    hash = "sha256-020nGSNxJL2/yFhEIjjyy850WcUmjMO/+OL1OYU0oIE=";
  };
  sourceRoot = "source/agimus_franka_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
    agimus-franka-description
    agimus-franka-hardware
    agimus-franka-robot-state-broadcaster
    controller-manager
    joint-state-broadcaster
    joint-state-publisher
    robot-state-publisher
    rviz2
    xacro
  ];
  checkInputs = [
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_bringup for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

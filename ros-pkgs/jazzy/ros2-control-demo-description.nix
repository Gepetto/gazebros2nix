{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  rviz2,

  # checkInputs

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-description";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "4b6ab8fca6af3a754a2b1249a50cb5de2e51c8d1";
    hash = "sha256-OO8j+qFf3qovtIPClyVGcx7vyYSwWHWDt9I64kCgf/Y=";
  };
  sourceRoot = "source/ros2_control_demo_description";

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
    rviz2
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "Package with URDF and description files of test robots.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/ros-controls/ros2_control_demos";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

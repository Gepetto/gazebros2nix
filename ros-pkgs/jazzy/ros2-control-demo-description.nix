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
}:
buildRosPackage rec {
  pname = "ros-jazzy-ros2-control-demo-description";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "ros-controls";
    repo = "ros2_control_demos";
    rev = "e9602bc2683fd01f76bf5c15d312e216c6db9b26";
    hash = "sha256-VMpoOTSCaWP0eNfFYspKvpren+3nDRP1sgfmFkCUJTM=";
  };
  sourceRoot = "source/ros2_control_demo_description";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    rviz2
  ];
  checkInputs = [
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

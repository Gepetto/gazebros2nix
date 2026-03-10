{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  joint-state-publisher-gui,
  realsense2-description,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-franka-description";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_description";
    rev = "d167e716414ddb186513bd402f8abc80e8f9dbe4";
    hash = "sha256-xs4JC6UjWMyHs/zN3nyimkByH+DQF5i+3lpCuuABvAY=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    joint-state-publisher-gui
    realsense2-description
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
  ];

  doCheck = false;

  meta = {
    description = "fork of franka_description with URDF files and meshes of Franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_franka_description";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

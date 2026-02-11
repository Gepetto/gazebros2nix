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
  ament-lint-auto,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-description";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_franka_description";
    rev = "46dbd53b6dbeb908436e0fcc1bc953307079d105";
    hash = "sha256-y+5yFRs7Mcn48DAE5sA0OnJmYLDE0mn3ZWQ7RLvdxmc=";
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
    ament-lint-auto
    ament-lint-common
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

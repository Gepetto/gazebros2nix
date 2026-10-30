{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  gz-ros2-control,
  joint-state-publisher-gui,
  realsense2-description,
  rviz2,
  xacro,

  # checkInputs
  ament-cmake-pytest,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-lyrical-agimus-franka-description";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-description";
    rev = "c785e6d764334667be2c4dcead3555866eea858a";
    hash = "sha256-Ple0ER9ysDUiD2ZzsOW9vzcvSRPqSpgZjW8eXYLmjI8=";
  };
  sourceRoot = "source/";

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
    gz-ros2-control
    joint-state-publisher-gui
    realsense2-description
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "fork of franka_description with URDF files and meshes of Franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-description";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

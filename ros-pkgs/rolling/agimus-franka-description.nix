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

  # nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-franka-description";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-description";
    rev = "f836ec0c769c98c917900c0789dbed69a2dc20a6";
    hash = "sha256-aJZWVxAqlB/5f4QUNXgxSn4SruH7zE/dUY9cCQ7XZVQ=";
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
    joint-state-publisher-gui
    realsense2-description
    rviz2
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
  ];
  nativeCheckInputs = [
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

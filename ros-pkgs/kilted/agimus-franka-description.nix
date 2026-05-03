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
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-franka-description";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-description";
    rev = "ed015db669453138b39064af263e985fa070079b";
    hash = "sha256-0vdCSQjb6r7L0QkSdhweHglFKQe68C038hRgOq/HpnE=";
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

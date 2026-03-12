{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosidl-default-generators,

  # buildInputs
  builtin-interfaces,
  eigen,
  geometry-msgs,
  jrl-cmakemodules,
  sensor-msgs,
  std-msgs,

  # propagatedBuildInputs
  rosidl-default-runtime,
  tf2-eigen,

  # checkInputs
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-common,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-linear-feedback-controller-msgs";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "loco-3d";
    repo = "linear-feedback-controller-msgs";
    tag = "v${version}";
    hash = "sha256-onJMrXvn3jWVNyY/A7utPDG11P3yZ5mtGt5ZnZ3ccxU=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosidl-default-generators
  ];
  buildInputs = [
    ament-cmake
    builtin-interfaces
    eigen
    geometry-msgs
    jrl-cmakemodules
    rosidl-default-generators
    sensor-msgs
    std-msgs
  ];
  propagatedBuildInputs = [
    rosidl-default-runtime
    tf2-eigen
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-cmake-pytest
    ament-lint-common
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "ROS msgs that interface the linear_feedback_controller package.";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/loco-3d/linear-feedback-controller-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

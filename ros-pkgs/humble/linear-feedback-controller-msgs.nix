{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  eigen3-cmake-module,
  rosidl-default-generators,

  # buildInputs
  builtin-interfaces,
  eigen,
  geometry-msgs,
  jrl-cmakemodules,
  sensor-msgs,
  std-msgs,
  tf2-eigen,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-common,
}:
buildRosPackage rec {
  pname = "ros-humble-linear-feedback-controller-msgs";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "loco-3d";
    repo = "linear-feedback-controller-msgs";
    tag = "v${version}";
    hash = "sha256-EFHYD5PC7HeUVZcLPqisUFfAFLsjpoR7xYqFaOx8bp4=";
  };
  sourceRoot = "source/";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    eigen3-cmake-module
    rosidl-default-generators
  ];
  buildInputs = [
    builtin-interfaces
    eigen
    geometry-msgs
    jrl-cmakemodules
    sensor-msgs
    std-msgs
    tf2-eigen
  ];
  propagatedBuildInputs = [
    rosidl-default-runtime
  ];
  checkInputs = [
    ament-cmake-gtest
    ament-cmake-pytest
    ament-lint-common
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

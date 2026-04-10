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
  tf2-eigen,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  ament-lint-common,

  # nativeCheckInputs
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-pep257,
  ament-uncrustify,
}:
buildRosPackage rec {
  pname = "ros-rolling-linear-feedback-controller-msgs";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "loco-3d";
    repo = "linear-feedback-controller-msgs";
    tag = "v${version}";
    hash = "sha256-VvDiU89PRYGzJ2bHaRJ7bw2pmgEXY5qqE4wZegV/NGw=";
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
    tf2-eigen
  ];
  propagatedBuildInputs = [
    builtin-interfaces
    eigen
    geometry-msgs
    rosidl-default-runtime
    sensor-msgs
    std-msgs
    tf2-eigen
  ];
  checkInputs = [
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-gtest
    ament-cmake-pep257
    ament-cmake-pytest
    ament-cmake-uncrustify
    ament-lint-common
  ];
  nativeCheckInputs = [
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-pep257
    ament-uncrustify
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

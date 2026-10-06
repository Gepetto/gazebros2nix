{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  rosdoc2,

  # buildInputs
  ament-cmake-auto,

  # propagatedBuildInputs
  launch,
  launch-param-builder,
  launch-ros,
  motkin-dual-motor-testbed-description,
  motkin-dual-motor-testbed-hardware,
  motkin-forward-command-controller,
  ros2launch,
  xacro,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-uncrustify,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-motkin-dual-motor-testbed-bringup";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "Gepetto";
    repo = "motkin-dual-motor-testbed-robot";
    tag = "v${version}";
    hash = "sha256-DlwOyh1HqqNfH5CH8HXmfrmvzCg6pghYavjPU1ZU3C4=";
  };
  sourceRoot = "source/motkin_dual_motor_testbed_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    rosdoc2
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    launch
    launch-param-builder
    launch-ros
    motkin-dual-motor-testbed-description
    motkin-dual-motor-testbed-hardware
    motkin-forward-command-controller
    ros2launch
    xacro
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-uncrustify
    ament-cmake-xmllint
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Package starting the MOTKIN dual motor testbed robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Gepetto/motkin-dual-motor-testbed-robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

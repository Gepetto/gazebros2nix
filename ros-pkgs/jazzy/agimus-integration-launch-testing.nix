{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  launch-testing,
  launch-testing-ament-cmake,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-flake8,
  ament-lint-cmake,
  ament-pep257,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-integration-launch-testing";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "c6609fcd10b4a9fcad84a93c8c92af7e66c78405";
    hash = "sha256-+A03A5j+b75v9E+sLBOc5KvJ8tuBDUGCVQmFOskqYhY=";
  };
  sourceRoot = "source/agimus_integration_launch_testing";

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
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-flake8
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    launch-testing
    launch-testing-ament-cmake
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "fork of integration_launch_testing for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-franka-ros2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

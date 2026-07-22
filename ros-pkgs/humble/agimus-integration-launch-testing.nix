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
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  launch-testing,
  launch-testing-ament-cmake,
  xmllintPackageHook,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
  ament-copyright,
  ament-lint-cmake,
  ament-pep257,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-integration-launch-testing";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-franka-ros2";
    rev = "8a05aced1fae55a09b3f019b6d2645ef45cf002d";
    hash = "sha256-+LMsdt14tBKIlo0KnfCYFoiYyFYYP4a1QkeEtpzRAIM=";
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
    ament-cmake-lint-cmake
    ament-cmake-pep257
    ament-cmake-xmllint
    launch-testing
    launch-testing-ament-cmake
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
    ament-copyright
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

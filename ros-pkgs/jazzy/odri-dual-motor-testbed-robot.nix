{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  controller-manager,
  xacro,

  # propagatedBuildInputs
  odri-dual-motor-testbed-bringup,
  odri-dual-motor-testbed-description,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-cppcheck,
  ament-cpplint,
  ament-lint-cmake,
  ament-xmllint,
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-dual-motor-testbed-robot";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "ce808abcbf62df8417f23775db447d5f515ea443";
    hash = "sha256-uf5wgrkdCvevNMEaVMnhthWuWcBx+7/RQg3GbnjWqDo=";
  };
  sourceRoot = "source/odri_dual_motor_testbed_robot";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
    controller-manager
    xacro
  ];
  propagatedBuildInputs = [
    controller-manager
    odri-dual-motor-testbed-bringup
    odri-dual-motor-testbed-description
    xacro
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-cppcheck
    ament-cmake-cpplint
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    ament-lint-auto
    ament-lint-common
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-lint-cmake
    ament-xmllint
  ];

  doCheck = true;

  meta = {
    description = "Meta package describing the ODRI dual motor testbed robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/stack-of-tasks/odri_dual_motor_testbed_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

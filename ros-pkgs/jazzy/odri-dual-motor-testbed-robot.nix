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
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
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
}:
buildRosPackage rec {
  pname = "ros-jazzy-odri-dual-motor-testbed-robot";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "stack-of-tasks";
    repo = "odri_dual_motor_testbed_robot";
    rev = "a3aab82561117ddd5fe4f90747e8f43803c3b38a";
    hash = "sha256-MRsDFCSpclK6rxRiRe5rHZ/u+cpeNJWhiolsWiMIEAo=";
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

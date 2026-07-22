{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,
  ament-cmake-python,

  # buildInputs

  # propagatedBuildInputs
  omni-base-description,
  pal-sea-arm-description,
  pal-urdf-utils,
  robot-state-publisher,
  tiago-pro-head-description,
  xacro,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-pytest,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  launch-testing-ament-cmake,
  urdf-test,
  xmllintPackageHook,

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
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
  pname = "ros-jazzy-tiago-pro-description";
  version = "1.36.0";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_robot";
    rev = "d1b9c50d78c1efe14e99c4c863726d784c4faaa0";
    hash = "sha256-v+TagYh15lgUwppdlX00nEHBovXONNsJgydrr3LEEDw=";
  };
  sourceRoot = "source/tiago_pro_description";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  buildInputs = [
    ament-cmake-auto
    ament-cmake-python
  ];
  propagatedBuildInputs = [
    omni-base-description
    pal-sea-arm-description
    pal-urdf-utils
    robot-state-publisher
    tiago-pro-head-description
    xacro
  ];
  checkInputs = [
    ament-cmake-pytest
    ament-lint-auto
    ament-lint-common
    launch-testing-ament-cmake
    urdf-test
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
    writableTmpDirAsHomeHook
    ament-copyright
    ament-cppcheck
    ament-cpplint
    ament-flake8
    ament-lint-cmake
    ament-pep257
    ament-uncrustify
    ament-xmllint
  ];

  doCheck = false;

  meta = {
    description = "The tiago_pro_description package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

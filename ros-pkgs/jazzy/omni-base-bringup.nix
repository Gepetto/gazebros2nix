{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  ament-index-python,
  diagnostic-aggregator,
  joy-linux,
  joy-teleop,
  launch-pal,
  omni-base-controller-configuration,
  omni-base-description,
  robot-state-publisher,
  twist-mux,

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
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-jazzy-omni-base-bringup";
  version = "2.15.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "omni_base_robot";
    rev = "a1033f17eafdba94462842689948860112dcb0a5";
    hash = "sha256-hlwsPp/8YDsVjUroz6NUjTKhtFSLdzp06UcdYQ6Nz1g=";
  };
  sourceRoot = "source/omni_base_bringup";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
    ament-cmake-auto
  ];
  propagatedBuildInputs = [
    ament-index-python
    diagnostic-aggregator
    joy-linux
    joy-teleop
    launch-pal
    omni-base-controller-configuration
    omni-base-description
    robot-state-publisher
    twist-mux
  ];
  checkInputs = [
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
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  meta = {
    description = "The omni_base_bringup package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  controller-manager,
  joint-state-broadcaster,
  ros2controlcli,
  topic-tools,

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
  pname = "ros-jazzy-omni-base-controller-configuration";
  version = "2.15.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "omni_base_robot";
    rev = "a1033f17eafdba94462842689948860112dcb0a5";
    hash = "sha256-hlwsPp/8YDsVjUroz6NUjTKhtFSLdzp06UcdYQ6Nz1g=";
  };
  sourceRoot = "source/omni_base_controller_configuration";

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
    controller-manager
    joint-state-broadcaster
    ros2controlcli
    topic-tools
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
    description = "The omni_base_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/omni_base_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

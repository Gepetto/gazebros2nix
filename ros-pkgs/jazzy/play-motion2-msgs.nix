{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  action-msgs,
  builtin-interfaces,
  rosidl-default-generators,

  # propagatedBuildInputs
  rosidl-default-runtime,

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
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
  pname = "ros-jazzy-play-motion2-msgs";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "play_motion2";
    rev = "f1bbfcc4c9fbe9a05181a18214003360480d8575";
    hash = "sha256-Cq3r+KePWMpTvuo7Z4U7NQNyvhfffUTNymYkauqcYFA=";
  };
  sourceRoot = "source/play_motion2_msgs";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    ament-cmake
    builtin-interfaces
    rosidl-default-generators
  ];
  propagatedBuildInputs = [
    action-msgs
    builtin-interfaces
    rosidl-default-runtime
  ];
  checkInputs = [
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
    description = "Play a pre-recorded motion on a robot";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/play_motion2";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

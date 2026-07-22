{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs
  action-msgs,
  geometry-msgs,
  rosidl-default-generators,
  std-msgs,

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
  pname = "ros-rolling-agimus-msgs";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-msgs";
    tag = "v${version}";
    hash = "sha256-j1eatFsB4Uek1n7x7gK5tSPi33B67mR8CXBVCDh+RFY=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    action-msgs
    ament-cmake
    geometry-msgs
    rosidl-default-generators
    std-msgs
  ];
  propagatedBuildInputs = [
    action-msgs
    geometry-msgs
    rosidl-default-runtime
    std-msgs
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

  doCheck = true;

  meta = {
    description = "Agimus project ROS messages";
    license = with lib.licenses; [ bsd2 ];
    homepage = "https://github.com/agimus-project/agimus-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

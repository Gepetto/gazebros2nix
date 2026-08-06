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
  kangaroo-controller-configuration,
  kangaroo-description,
  play-motion2,
  play-motion2-cli,
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
  pname = "ros-jazzy-kangaroo-bringup";
  version = "2.15.0";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_robot";
    tag = version;
    hash = "sha256-ocHhrTH8Xm1r5bkVyYUg5s86n8WSjRE5PlOeKgiL4Ng=";
  };
  sourceRoot = "source/kangaroo_bringup";

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
    kangaroo-controller-configuration
    kangaroo-description
    play-motion2
    play-motion2-cli
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
    description = "The kangaroo_bringup package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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
  joint-state-broadcaster,
  joint-trajectory-controller,
  launch,
  launch-pal,
  ros2controlcli,

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
  pname = "ros-alum-kangaroo-controller-configuration";
  version = "2.13.2";

  src = fetchFromGitHub {
    owner = "pal-robotics";
    repo = "kangaroo_robot";
    tag = version;
    hash = "sha256-FeNxJSm840h/vULyYyGL00csbXzXl3wMK7fW5ccQ6MY=";
  };
  sourceRoot = "source/kangaroo_controller_configuration";

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
    joint-state-broadcaster
    joint-trajectory-controller
    launch
    launch-pal
    ros2controlcli
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
    description = "The kangaroo_controller_configuration package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/pal-robotics/kangaroo_robot";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

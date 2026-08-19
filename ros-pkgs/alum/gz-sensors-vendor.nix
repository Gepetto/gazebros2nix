{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-core,
  ament-cmake-test,
  ament-cmake-vendor-package,
  cmake,

  # buildInputs
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-msgs-vendor,
  gz-rendering-vendor,
  gz-tools-vendor,
  gz-transport-vendor,
  sdformat-vendor,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  xmllintPackageHook,
  xorg,

  # nativeCheckInputs
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-sensors-vendor";
  version = "0.0.6";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_sensors_vendor";
    tag = version;
    hash = "sha256-pDFtXaG0iGacqzSfNZieFqDJDxD3nimkSUK7gWt99Ug=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
  ];
  buildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    cmake
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-rendering-vendor
    gz-tools-vendor
    gz-transport-vendor
    sdformat-vendor
  ];
  propagatedBuildInputs = [
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-msgs-vendor
    gz-rendering-vendor
    gz-tools-vendor
    gz-transport-vendor
    sdformat-vendor
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
    xorg.xorgserver
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-copyright
    ament-lint-cmake
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for: gz-sensors8 8.2.2

    Gazebo Sensors : Sensor models for simulation";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_sensors_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

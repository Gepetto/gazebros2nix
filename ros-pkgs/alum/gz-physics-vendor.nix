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
  bullet,
  eigen,
  gbenchmark,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-dartsim-vendor,
  gz-math-vendor,
  gz-plugin-vendor,
  gz-utils-vendor,
  sdformat-vendor,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-copyright,
  ament-lint-cmake,
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-physics-vendor";
  version = "0.0.10";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_physics_vendor";
    tag = version;
    hash = "sha256-2aTF4xIyVpD3ylSENIftQUpbl4SErNsChqd3VXe8dsk=";
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
    bullet
    cmake
    eigen
    gbenchmark
    gz-cmake-vendor
    gz-common-vendor
    gz-dartsim-vendor
    gz-math-vendor
    gz-plugin-vendor
    gz-utils-vendor
    sdformat-vendor
  ];
  propagatedBuildInputs = [
    bullet
    eigen
    gbenchmark
    gz-cmake-vendor
    gz-common-vendor
    gz-dartsim-vendor
    gz-math-vendor
    gz-plugin-vendor
    gz-utils-vendor
    sdformat-vendor
  ];
  checkInputs = [
    ament-cmake-copyright
    ament-cmake-lint-cmake
    ament-cmake-xmllint
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
    description = "Vendor package for: gz-physics7 7.9.0

    Gazebo Physics : Physics classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_physics_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

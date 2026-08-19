{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-core,
  ament-cmake-test,
  ament-cmake-vendor-package,
  cmake,
  pkg-config,

  # buildInputs
  assimp,
  ffmpeg,
  freeimage,
  gdal,
  gts,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-utils-vendor,
  tinyxml-2,
  util-linux,

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
  pname = "ros-alum-gz-common-vendor";
  version = "0.0.9";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_common_vendor";
    tag = version;
    hash = "sha256-nvQpLaW+iwhlckrlDBtq6ogDjeikEwW52ZXw4M3rqSA=";
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
    pkg-config
  ];
  buildInputs = [
    ament-cmake-core
    ament-cmake-test
    ament-cmake-vendor-package
    assimp
    cmake
    ffmpeg
    freeimage
    gdal
    gts
    gz-cmake-vendor
    gz-math-vendor
    gz-utils-vendor
    tinyxml-2
    util-linux
  ];
  propagatedBuildInputs = [
    assimp
    ffmpeg
    freeimage
    gdal
    gts
    gz-cmake-vendor
    gz-math-vendor
    gz-utils-vendor
    tinyxml-2
    util-linux
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
    description = "Vendor package for: gz-common5 5.8.0

    Gazebo Common : AV, Graphics, Events, and much more.";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_common_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

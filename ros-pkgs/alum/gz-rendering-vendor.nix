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
  freeglut,
  freeimage,
  glew,
  gz-cmake-vendor,
  gz-common-vendor,
  gz-math-vendor,
  gz-ogre-next-vendor,
  gz-plugin-vendor,
  gz-utils-vendor,
  libxi,
  libxmu,
  ogre1_9,
  util-linux,
  vulkan-loader,

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
  pname = "ros-alum-gz-rendering-vendor";
  version = "0.0.8";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_rendering_vendor";
    tag = version;
    hash = "sha256-p0zDDkk17hdSFhm9rg1OyJUHGy/awWYSUq3uDAk8eDY=";
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
    freeglut
    freeimage
    glew
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-ogre-next-vendor
    gz-plugin-vendor
    gz-utils-vendor
    libxi
    libxmu
    ogre1_9
    util-linux
    vulkan-loader
  ];
  propagatedBuildInputs = [
    freeglut
    freeimage
    glew
    gz-cmake-vendor
    gz-common-vendor
    gz-math-vendor
    gz-ogre-next-vendor
    gz-plugin-vendor
    gz-utils-vendor
    libxi
    libxmu
    ogre1_9
    util-linux
    vulkan-loader
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
    description = "Vendor package for: gz-rendering8 8.3.0

    Gazebo Rendering: Rendering library for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebo-release/gz_rendering_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

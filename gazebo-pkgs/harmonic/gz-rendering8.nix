{
  lib,
  stdenv,
  fetchFromGitHub,

  boost,
  cmake,
  freeglut,
  freeimage,
  glew,
  gz-cmake,
  gz-common,
  gz-common5,
  gz-math,
  gz-math7,
  gz-plugin,
  gz-plugin2,
  gz-utils,
  gz-utils2,
  libogre-next-23-dev,
  libxi,
  libxmu,
  ogre1_9,
  pkg-config,
  python3,
  util-linux,
  vulkan-loader,
  writableTmpDirAsHomeHook,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-rendering8";
  version = "8.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "gz-rendering8_8.3.0";
    hash = "sha256-NKVvq25+GUiXWB8ICeKrnUSrITAouC5EOxTNWqpEhZ8=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    boost
    freeglut
    freeimage
    glew
    gz-cmake
    gz-common
    gz-common5
    gz-math
    gz-math7
    gz-plugin
    gz-plugin2
    gz-utils
    gz-utils2
    libogre-next-23-dev
    libxi
    libxmu
    ogre1_9
    util-linux
    vulkan-loader
  ];
  checkInputs = [
    xorg.xorgserver
  ];
  nativeCheckInputs = [
    freeglut
    freeimage
    glew
    gz-common5
    gz-math7
    gz-plugin2
    gz-utils2
    libogre-next-23-dev
    libxi
    libxmu
    ogre1_9
    util-linux
    vulkan-loader
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Rendering: Rendering library for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-rendering";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

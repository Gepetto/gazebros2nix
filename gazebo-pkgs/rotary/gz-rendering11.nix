{
  lib,
  stdenv,
  fetchFromGitHub,

  boost,
  cmake,
  freeglut,
  glew,
  gz-cmake,
  gz-common,
  gz-math,
  gz-plugin,
  gz-utils,
  libGL,
  libGLU,
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
  pname = "gz-rotary-gz-rendering11";
  version = "11.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "gz-rendering11_11.0.0-pre1";
    hash = "sha256-WWQS11ScmdQImEnb9jMOqv/I2RDEZZGZ+ofCy87Nnm4=";
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
    glew
    gz-cmake
    gz-common
    gz-math
    gz-plugin
    gz-utils
    libGL
    libGLU
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
    glew
    gz-common
    gz-math
    gz-plugin
    gz-utils
    libGL
    libGLU
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
  doInstallCheck = true;

  meta = {
    description = "Gazebo Rendering: Rendering library for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-rendering";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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
  ogre1_9,
  pkg-config,
  util-linux,
  vulkan-loader,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-rendering8";
  version = "8.2.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "gz-rendering8_8.2.2";
    hash = "sha256-x+QHn8d+19U12CG1+HEmP0KcM3beY00Vvrc8mrxvAs0=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
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
    ogre1_9
    util-linux
    vulkan-loader
    xorg.libXi
    xorg.libXmu
  ];
  checkInputs = [
    xorg.xorgserver
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Rendering: Rendering library for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-rendering";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

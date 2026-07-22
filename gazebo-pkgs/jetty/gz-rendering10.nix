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
  gz-math,
  gz-plugin,
  gz-utils,
  libGL,
  libGLU,
  libogre-next-23-dev,
  libxi,
  libxmu,
  libz,
  ogre1_9,
  pkg-config,
  python3,
  util-linux,
  vulkan-loader,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-rendering10";
  version = "10.0.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "gz-rendering10_10.0.2";
    hash = "sha256-xdIdwBcox+la4WtbSY5Z3VnWRzhuBsrcu6Rdd4hhNGI=";
  };

  __structuredAttrs = true;
  strictDeps = true;

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
    gz-math
    gz-plugin
    gz-utils
    libGL
    libGLU
    libogre-next-23-dev
    libxi
    libxmu
    libz
    ogre1_9
    python3
    util-linux
    vulkan-loader
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

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
  gz-common6,
  gz-math,
  gz-math8,
  gz-plugin,
  gz-plugin3,
  gz-utils,
  gz-utils3,
  libogre-next-23-dev,
  libz,
  ogre1_9,
  pkg-config,
  python3,
  util-linux,
  vulkan-loader,
  xorg,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-rendering9";
  version = "9.3.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "gz-rendering9_9.3.0";
    hash = "sha256-mNDjqp54Y13BzZQdKvIfZkxXPq2Kn26sO9Gf+/aCaPk=";
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
    gz-common6
    gz-math
    gz-math8
    gz-plugin
    gz-plugin3
    gz-utils
    gz-utils3
    libogre-next-23-dev
    libz
    ogre1_9
    python3
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

{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  boost,
  cmake,
  freeglut,
  freeimage,
  glew,
  ign-cmake,
  ign-common,
  ign-math,
  ign-plugin,
  ign-utils,
  libogre-next-23-dev,
  ogre1_9,
  pkg-config,
  util-linux,
  vulkan-loader,
  xorg,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-rendering6";
  version = "6.6.3";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "ignition-rendering6_6.6.3";
    hash = "sha256-FV35+LobIFJANJ+P6EOYQWVCIKVOpzmiDgLOk7axdMA=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-rendering/pull/1017.patch";
      hash = "sha256-NQuyeGGZjzH4qm9CC+W/HdwmLx8d0HmP6S7dLRv8hSA=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    boost
    freeglut
    freeimage
    glew
    ign-cmake
    ign-common
    ign-common
    ign-math
    ign-math
    ign-plugin
    ign-plugin
    ign-utils
    ign-utils
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

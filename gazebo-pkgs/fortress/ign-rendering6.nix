{
  lib,
  stdenv,
  fetchFromGitHub,

  boost,
  cmake,
  freeglut,
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
  version = "6.6.4";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-rendering";
    tag = "ignition-rendering6_6.6.4";
    hash = "sha256-fKsPosKFp/0bQTmoAmZL0vxlreOHhx3jnJ8TUm9LyHE=";
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
    glew
    ign-cmake
    ign-common
    ign-math
    ign-plugin
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

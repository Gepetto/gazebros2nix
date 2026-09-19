# thanks https://github.com/muellerbernd/gazebo-sim-overlay/blob/main/pkgs/ogre-next/default.nix
{
  fetchFromGitHub,
  stdenv,
  lib,
  pkg-config,
  cmake,
  libGLU,
  freetype,
  freeimage,
  zziplib,
  libXaw,
  ninja,
  tinyxml,
  rapidjson,
  openvr,
  cppunit,
  vulkan-headers,
  shaderc,
  SDL2,
  doxygen,
  mesa,
  graphviz,
  zlib,
  libXrandr,
  libxcb,
}:
stdenv.mkDerivation (_finalAttrs: {
  pname = "ogre-next";
  version = "2.3.3";

  src = fetchFromGitHub {
    owner = "OGRECave";
    repo = "ogre-next";
    # rev = "v${finalAttrs.version}";
    rev = "06c53d072271276e07aef2233114a2dc5fa18ae2"; # branch v2-3
    hash = "sha256-9gtF0fWmNsezYHvu0h2P/JLsnihvBTWGnGMYtCEEsPE=";
  };

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DOGRE_USE_NEW_PROJECT_NAME=ON"
    "-DOGRE_CONFIG_ENABLE_JSON=ON"
    "-DOGRE_CONFIG_THREADS=1"
    "-DOGRE_CONFIG_THREAD_PROVIDER=std"
    "-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON"
    "-DOGRE_BUILD_COMPONENT_OVERLAY=ON"
    "-DOGRE_BUILD_COMPONENT_PROPERTY=ON"
    "-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON"
    "-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON"
    "-DOGRE_BUILD_TESTS=ON"
    "-DOGRE_INSTALL_SAMPLES_SOURCE=ON"
    "-DOGRE_GLSUPPORT_USE_EGL_HEADLESS=ON"
    "-DOGRE_GLSUPPORT_USE_GLX=ON"
    "-DOGRE_VULKAN_WINDOW_NULL=ON"
    "-DOGRE_VULKAN_WINDOW_XCB=ON"
    "-DOGRE_CONFIG_UNIX_NO_X11=OFF"
  ];

  nativeBuildInputs = [
    cmake
    doxygen
    graphviz
    mesa
    ninja
    cppunit
    pkg-config
  ];

  buildInputs = [
    vulkan-headers
    shaderc
    freeimage
    freetype
    libXaw
    libXrandr
    rapidjson
    zziplib
    SDL2
    libGLU
    tinyxml
    zlib
    openvr
    libxcb
  ];

  meta = with lib; {
    description = "3D Object-Oriented Graphics Rendering Engine
    aka ogre v2 - scene-oriented, flexible 3D C++ engine ";
    homepage = "https://ogrecave.github.io/ogre-next/api/latest";
    maintainers = with maintainers; [
      muellerbernd
      nim65s
    ];
    platforms = platforms.linux;
    license = licenses.mit;
  };
})

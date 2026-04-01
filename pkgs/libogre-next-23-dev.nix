# thanks https://github.com/muellerbernd/gazebo-sim-overlay/blob/main/pkgs/ogre-next/default.nix
{
  fetchFromGitHub,
  stdenv,
  lib,
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
stdenv.mkDerivation (finalAttrs: {
  pname = "ogre-next";
  version = "2.3.3";

  src = fetchFromGitHub {
    # owner = "OGRECave";
    owner = "nim65s"; # ref. https://github.com/OGRECave/ogre-next/pull/564
    repo = "ogre-next";
    # rev = "v${finalAttrs.version}";
    rev = "a29bd710e08e6503142b643d11a2d1e37b2cd028";
    hash = "sha256-0+NKWKqoQ+Zqx9hj8LQDQ1qRXyBHUcKhY+uYDRVXlnw=";
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
  ];

  nativeBuildInputs = [
    cmake
    doxygen
    graphviz
    mesa
    ninja
    cppunit
    vulkan-headers
    shaderc
  ];

  buildInputs = [
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
    maintainers = with maintainers; [ muellerbernd ];
    platforms = platforms.linux;
    license = licenses.mit;
  };
})

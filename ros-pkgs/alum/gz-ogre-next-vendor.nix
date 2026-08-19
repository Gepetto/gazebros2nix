{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-vendor-package,

  # buildInputs
  SDL2,
  boost,
  freeimage,
  freetype,
  glslang,
  libGL,
  libGLU,
  libx11,
  libxaw,
  libxcb,
  libxrandr,
  onetbb,
  poco,
  rapidjson,
  shaderc,
  tinyxml-2,
  vulkan-loader,
  zziplib,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-xmllint,
  ament-lint-auto,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-ogre-next-vendor";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_ogre_next_vendor";
    tag = version;
    hash = "sha256-4kfeqp5NoagMC+EqNw8tl7dtjCFunMNruZhuWfzyVow=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-vendor-package
  ];
  buildInputs = [
    SDL2
    ament-cmake
    ament-cmake-vendor-package
    boost
    freeimage
    freetype
    glslang
    libGL
    libGLU
    libx11
    libxaw
    libxcb
    libxrandr
    onetbb
    poco
    rapidjson
    shaderc
    tinyxml-2
    vulkan-loader
    zziplib
  ];
  propagatedBuildInputs = [
    SDL2
    boost
    freeimage
    freetype
    glslang
    libGL
    libGLU
    libx11
    libxaw
    libxcb
    libxrandr
    onetbb
    poco
    rapidjson
    shaderc
    tinyxml-2
    vulkan-loader
    zziplib
  ];
  checkInputs = [
    ament-cmake-xmllint
    ament-lint-auto
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for Ogre-next v2.3.3";
    license = with lib.licenses; [
      asl20
      mit
    ];
    homepage = "https://github.com/gazebo-release/gz_ogre_next_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

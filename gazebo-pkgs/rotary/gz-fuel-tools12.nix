{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  curl,
  gflags,
  gz-cmake,
  gz-common,
  gz-math,
  gz-msgs,
  gz-tools,
  gz-utils,
  jsoncpp,
  libyaml,
  libzip,
  pkg-config,
  python3,
  tinyxml-2,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-rotary-gz-fuel-tools12";
  version = "12.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-fuel-tools";
    tag = "gz-fuel-tools12_12.0.0-pre2";
    hash = "sha256-4VVDgMos+7Rlr89qVjTCNBu4AKeLuA1MLHOoa0lU/rw=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    curl
    gflags
    gz-cmake
    gz-common
    gz-math
    gz-msgs
    gz-tools
    gz-utils
    jsoncpp
    libyaml
    libzip
    tinyxml-2
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    curl
    gflags
    gz-common
    gz-math
    gz-msgs
    gz-tools
    gz-utils
    jsoncpp
    libyaml
    libzip
    tinyxml-2
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-fuel-tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

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
  gz-tools2,
  gz-utils,
  jsoncpp,
  libyaml,
  libzip,
  pkg-config,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-fuel-tools11";
  version = "11.0.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-fuel-tools";
    tag = "gz-fuel-tools11_11.0.0";
    hash = "sha256-IFnaXBURpN5xTCxFjlcZk9n0sCsUnPBr3NUZrf7Xde0=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    curl
    gflags
    gz-cmake
    gz-common
    gz-math
    gz-msgs
    gz-tools
    gz-tools2
    gz-utils
    jsoncpp
    libyaml
    libzip
    tinyxml-2
  ];
  checkInputs = [
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-fuel-tools";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

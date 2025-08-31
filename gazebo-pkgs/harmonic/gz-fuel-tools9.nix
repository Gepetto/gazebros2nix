{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  curl,
  gflags,
  gz-cmake,
  gz-common,
  gz-common5,
  gz-math,
  gz-math7,
  gz-msgs,
  gz-msgs10,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils2,
  jsoncpp,
  libyaml,
  libzip,
  pkg-config,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "gz-harmonic-gz-fuel-tools9";
  version = "9.1.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-fuel-tools";
    tag = "gz-fuel-tools9_9.1.1";
    hash = "sha256-XQoBcCtzwzzPypS1kIeTCIbjtxrzaW3JvZLCYbwXAOk=";
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
    gz-common5
    gz-math
    gz-math7
    gz-msgs
    gz-msgs10
    gz-tools
    gz-tools2
    gz-utils
    gz-utils2
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

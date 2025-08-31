{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  curl,
  gflags,
  gz-cmake,
  gz-common,
  gz-common6,
  gz-math,
  gz-math8,
  gz-msgs,
  gz-msgs11,
  gz-tools,
  gz-tools2,
  gz-utils,
  gz-utils3,
  jsoncpp,
  libyaml,
  libzip,
  pkg-config,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "gz-ionic-gz-fuel-tools10";
  version = "10.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-fuel-tools";
    tag = "gz-fuel-tools10_10.1.0";
    hash = "sha256-ONo0zmKHSu1i6GAouDzFD5T2PUNXJ4IjhgPSoORRzao=";
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
    gz-common6
    gz-math
    gz-math8
    gz-msgs
    gz-msgs11
    gz-tools
    gz-tools2
    gz-utils
    gz-utils3
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

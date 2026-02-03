{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  gz-cmake,
  gz-math,
  gz-tools,
  gz-tools2,
  gz-utils,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-msgs12";
  version = "12.0.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "gz-msgs12_12.0.1";
    hash = "sha256-XMzokmj6DXiDtbE/FNK+j4qllm7IsmE8vZsQSXEQNIs=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-tools
    gz-tools2
    gz-utils
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

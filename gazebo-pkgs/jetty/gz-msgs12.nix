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
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-msgs12";
  version = "12.1.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "gz-msgs12_12.1.0";
    hash = "sha256-oXmOx6d4DWD26CcO2gAykw7vbMchKhdr0eh5CV8UaK4=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    gz-cmake
    gz-math
    gz-tools
    gz-tools2
    gz-utils
    protobuf
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    gz-math
    gz-tools2
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = false;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

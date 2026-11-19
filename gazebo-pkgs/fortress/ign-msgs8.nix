{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  ign-cmake,
  ign-math,
  ign-tools,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-msgs8";
  version = "8.7.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "ignition-msgs8_8.7.2";
    hash = "sha256-w4eQvA+x3CTZs7FtPD/qHCnJkM9jUzMKAu70YQ26zyQ=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-math
    ign-tools
    protobuf
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

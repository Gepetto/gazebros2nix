{
  lib,
  stdenv,
  fetchFromGitHub,

  cli11,
  cmake,
  ign-cmake,
  pkg-config,
  python3,
  spdlog,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-utils1";
  version = "1_1.5.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-utils";
    tag = "ignition-utils1_1.5.1";
    hash = "sha256-Ymlw1SBoSlHwxe/4E3jdMy8ECCFNy8YGboqTQi6UIs4=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
    cli11
    ign-cmake
    spdlog
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    cli11
    spdlog
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo Utils : Classes and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-utils";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

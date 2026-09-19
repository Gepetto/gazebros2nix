{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  pkg-config,
  python3,
  writableTmpDirAsHomeHook,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-cmake5";
  version = "5.1.1";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-cmake";
    tag = "gz-cmake5_5.1.1";
    hash = "sha256-bp3qaLuE/0sf6u4ZVOGsuJVkuEm2IS0zB0vHMVE0g/g=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo CMake : CMake Modules for Gazebo Projects";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-cmake";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

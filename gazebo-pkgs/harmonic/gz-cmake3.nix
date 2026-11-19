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
  pname = "gz-harmonic-gz-cmake3";
  version = "3.7.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-cmake";
    tag = "gz-cmake3_3.7.0";
    hash = "sha256-QuEr7w7Ow4AJGb0qonzlCM5HDeJLuC6TsziLryA4aXE=";
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

  doCheck = false;
  doInstallCheck = true;

  meta = {
    description = "Gazebo CMake : CMake Modules for Gazebo Projects";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-cmake";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

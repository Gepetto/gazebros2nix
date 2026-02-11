{
  lib,
  stdenv,
  fetchFromGitHub,

  cmake,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "gz-jetty-gz-cmake5";
  version = "5.0.2";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-cmake";
    tag = "gz-cmake5_5.0.2";
    hash = "sha256-OEEG4hQK8YxEl2SXqi02pNsLVD3biyKEW7kRQlFrRqs=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
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

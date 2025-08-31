{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,

  cmake,
  ign-cmake,
  ign-math,
  ign-tools,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  tinyxml-2,
}:
stdenv.mkDerivation {
  pname = "ign-fortress-ign-msgs8";
  version = "8.7.0";

  rosPackage = true;
  dontWrapQtApps = true;

  src = fetchFromGitHub {
    owner = "gazebosim";
    repo = "gz-msgs";
    tag = "ignition-msgs8_8.7.0";
    hash = "sha256-hG4UJfcq6DsyMqTWIcUQ15UCQNfdzTzwvJBpR9kmu84=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/gazebosim/gz-msgs/commit/0c0926c37042ac8f5aeb49ac36101acd3e084c6b.patch";
      hash = "sha256-QnR1WtB4gbgyJKbQ4doMhfSjJBksEeQ3Us4y9KqCWeY=";
    })
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  propagatedBuildInputs = [
    ign-cmake
    ign-math
    ign-math
    ign-tools
    ign-tools
    protobuf
    python3
    python3Packages.protobuf
    tinyxml-2
  ];
  checkInputs = [
    python3Packages.pytest
  ];

  cmakeFlags = [ "-DCMAKE_INSTALL_LIBDIR=lib" ];

  doCheck = true;

  meta = {
    description = "Gazebo Messages: Protobuf messages and functions for robot applications";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gazebosim/gz-msgs";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

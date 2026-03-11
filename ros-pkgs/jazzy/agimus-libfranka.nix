{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  doxygen,

  # buildInputs
  poco,

  # propagatedBuildInputs
  agimus-libfranka-common,

  # checkInputs
  gmock,
  gtest,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka";
    rev = "652c902b68dc10b8cd9b65cf3c68587e13d09197";
    hash = "sha256-zwdER+AIiL9BwBDzJgBn43gFuuO7InfedzVUnKBYaqc=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
    doxygen
  ];
  buildInputs = [
    poco
  ];
  propagatedBuildInputs = [
    agimus-libfranka-common
  ];
  checkInputs = [
    gmock
    gtest
  ];

  doCheck = false;

  meta = {
    description = "fork of libagimus_franka for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

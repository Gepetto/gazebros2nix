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
  eigen,

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
    rev = "c669067a902d4e835d68f01a10bbe72a72d47607";
    hash = "sha256-OHo/TR2Thel6TIxzskQs1D+4uUl9WH3pEV+cvpxbxUI=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

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
    eigen
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

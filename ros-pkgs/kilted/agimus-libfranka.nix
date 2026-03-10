{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

  # buildInputs
  agimus-libfranka-common,
  eigen,
  poco,

  # propagatedBuildInputs

  # checkInputs
  gmock,
  gtest,
}:
buildRosPackage rec {
  pname = "ros-kilted-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_libfranka";
    rev = "3204e361ada5960c864426868988d93f1276b2e5";
    hash = "sha256-iMCDIMvR30FAL8Ussf2bt/VXjftVtRJ/h0v5ybXXhyo=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    agimus-libfranka-common
    eigen
    poco
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    gmock
    gtest
  ];

  doCheck = true;

  meta = {
    description = "fork of libagimus_franka for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

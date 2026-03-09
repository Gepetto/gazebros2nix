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
  gtest,
}:
buildRosPackage rec {
  pname = "ros-jazzy-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_libfranka";
    rev = "69c80cdf6ed99a89c31f253a02318eec5a769a84";
    hash = "sha256-XbuRAvVC3QGrdzxQBQGcuFzrgkb6aA9gRlOPL1ESJyM=";
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
    gtest
  ];

  doCheck = false;

  meta = {
    description = "fork of libagimus_franka for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

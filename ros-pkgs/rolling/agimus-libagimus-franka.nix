{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

  # buildInputs
  agimus-libagimus-franka-common,
  eigen,
  poco,

  # propagatedBuildInputs

  # checkInputs
  gtest,
}:
buildRosPackage rec {
  pname = "ros-rolling-agimus-libagimus-franka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_libfranka";
    rev = "6c7814985023d4b66925a788d80a6a58ac34a1a3";
    hash = "sha256-9H+mmLy5UOmVYkGWpE/FhroZvlAoVXzM2aFyvIMamCQ=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    agimus-libagimus-franka-common
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

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
  pname = "ros-humble-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_libfranka";
    rev = "786e93e98c323d36d57866cd3f25d1f2851eb2e9";
    hash = "sha256-xEVVJz2GSSvUN85gjes3vai5HNVOzEpeuSRNv8Vr3qE=";
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
    description = "fork of libfranka for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

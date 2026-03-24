{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  doxygen,

  # buildInputs
  agimus-libfranka-common,
  eigen,
  poco,

  # propagatedBuildInputs

  # checkInputs
  gtest,

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka";
    rev = "786e93e98c323d36d57866cd3f25d1f2851eb2e9";
    hash = "sha256-xEVVJz2GSSvUN85gjes3vai5HNVOzEpeuSRNv8Vr3qE=";
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
    agimus-libfranka-common
    cmake
    eigen
    poco
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
    gtest
  ];
  nativeCheckInputs = [
  ];

  doCheck = false;

  meta = {
    description = "fork of libfranka for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

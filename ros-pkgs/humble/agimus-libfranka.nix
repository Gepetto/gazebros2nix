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
  gmock,
  gtest,
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus-libfranka";
    rev = "d6e4584a19e76ae4e60680154570102c34af635e";
    hash = "sha256-ddszujLVkeb9DXdtw3F/gp2L+gpwG3zd5mCQsevureg=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
    doxygen
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

  doCheck = false;

  meta = {
    description = "fork of libagimus_franka for agimus_franka robots not maintained anymore by agimus_franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus-libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

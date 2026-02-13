{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  cmake,

  # buildInputs
  eigen,
  poco,

# propagatedBuildInputs

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-humble-agimus-libfranka";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "agimus_libfranka";
    rev = "9324869e87b5988678280194f6a13ecdff266f9a";
    hash = "sha256-8hkZS7TtjWpOaqHC+532+c5+YIfBMKTqFbcxpRmPxj8=";
  };
  sourceRoot = "source/";

  buildType = "cmake";

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    eigen
    poco
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
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

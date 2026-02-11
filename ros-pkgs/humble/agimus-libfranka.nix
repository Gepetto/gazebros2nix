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
    rev = "fe6e37c49123058c12e27d2802911ca1d246f332";
    hash = "sha256-/iMJ4XJxuyd92ulMO1CH5AYq5yl/sfccAMqjTK1odeI=";
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
    description = "fork of franka_bringup for franka robots not maintained anymore by franka";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/agimus-project/agimus_libfranka";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

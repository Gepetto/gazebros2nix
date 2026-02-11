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
    rev = "2121110ec171ebea79849004501bbac19cafac50";
    hash = "sha256-uF1W0eNV2ihUvrzKUi44Lhx3inWRhsecZHegcxVcn+c=";
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

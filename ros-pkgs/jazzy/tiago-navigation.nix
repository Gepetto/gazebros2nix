{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake-auto,

  # buildInputs

  # propagatedBuildInputs
  tiago-2dnav,
  tiago-laser-sensors,

  # checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-navigation";
  version = "4.2.0";

  src = fetchFromGitHub {
    owner = "Tiago-Harmonic";
    repo = "tiago_navigation";
    rev = "280353f804da563ab44435eed703461675741583";
    hash = "sha256-FKZqkVNpsG12PL8Z9dZp8kuPi/zh1h+uo92H3pknS+A=";
  };
  sourceRoot = "source/tiago_navigation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake-auto
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-2dnav
    tiago-laser-sensors
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "TIAGo navigation metapackage";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Harmonic/tiago_navigation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

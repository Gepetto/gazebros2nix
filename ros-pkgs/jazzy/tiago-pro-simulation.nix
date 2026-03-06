{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  tiago-pro-gazebo,

# checkInputs
}:
buildRosPackage rec {
  pname = "ros-jazzy-tiago-pro-simulation";
  version = "1.14.1";

  src = fetchFromGitHub {
    owner = "Tiago-Pro-Harmonic";
    repo = "tiago_pro_simulation";
    rev = "d6614ff98f6851a7e9a4c810b9fcf0b6fe63970f";
    hash = "sha256-IvKGUxCHWWwJVRPF9o8xpE9R3+FGxSoaLNuDZQQTdu4=";
  };
  sourceRoot = "source/tiago_pro_simulation";

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
  ];
  propagatedBuildInputs = [
    tiago-pro-gazebo
  ];
  checkInputs = [
  ];

  doCheck = true;

  meta = {
    description = "The tiago_pro_simulation package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/Tiago-Pro-Harmonic/tiago_pro_simulation";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

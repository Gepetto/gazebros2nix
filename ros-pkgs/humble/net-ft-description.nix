{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

# buildInputs

# propagatedBuildInputs

# checkInputs

# nativeCheckInputs
}:
buildRosPackage rec {
  pname = "ros-humble-net-ft-description";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "gbartyzel";
    repo = "ros2_net_ft_driver";
    tag = "v${version}";
    hash = "sha256-0gTNXhQiWwHNozPVgHz3wbh74RfkKDgceIHByk77Dcc=";
  };
  sourceRoot = "source/net_ft_description";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
  ];
  buildInputs = [
    ament-cmake
  ];
  propagatedBuildInputs = [
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
  ];

  doCheck = true;

  meta = {
    description = "URDF description for F/T sensors";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/gbartyzel/ros2_net_ft_driver";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

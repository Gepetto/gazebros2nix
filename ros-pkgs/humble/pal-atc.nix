{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,

  # buildInputs

  # propagatedBuildInputs
  pal-atc-controller-configuration,
  pal-atc-description,

  # checkInputs

  # nativeCheckInputs
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-humble-pal-atc";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "clementPene";
    repo = "pal_atc";
    rev = "511b972963b8544a33eb555f92617138375edf97";
    hash = "sha256-wYSAs1gI9lf9PPGRD4KXSpchtBTxfLq8iFedOf+/mC4=";
  };
  sourceRoot = "source/pal_atc";

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
    pal-atc-controller-configuration
    pal-atc-description
  ];
  checkInputs = [
  ];
  nativeCheckInputs = [
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "The pal_atc package";
    license = with lib.licenses; [ asl20 ];
    homepage = "https://github.com/clementPene/pal_atc";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

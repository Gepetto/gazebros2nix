{
  lib,
  buildRosPackage,
  fetchFromGitHub,

  # nativeBuildInputs
  ament-cmake,
  ament-cmake-vendor-package,

  # buildInputs
  assimp,
  boost,
  bullet,
  eigen,
  fcl,
  fmt,
  libccd,
  lz4,
  ode,
  tinyxml-2,
  urdfdom,

  # propagatedBuildInputs

  # checkInputs
  ament-cmake-xmllint,
  ament-lint-auto,
  xmllintPackageHook,

  # nativeCheckInputs
  ament-xmllint,
  writableTmpDirAsHomeHook,
}:
buildRosPackage rec {
  pname = "ros-alum-gz-dartsim-vendor";
  version = "0.0.3";

  src = fetchFromGitHub {
    owner = "gazebo-release";
    repo = "gz_dartsim_vendor";
    tag = version;
    hash = "sha256-B6QSeeHCwixbeQXeGfaOBZ3mCQ4o3ulgkfqtq/l2P34=";
  };
  sourceRoot = "source/";

  __structuredAttrs = true;
  strictDeps = true;

  buildType = "ament_cmake";

  nativeBuildInputs = [
    ament-cmake
    ament-cmake-vendor-package
  ];
  buildInputs = [
    ament-cmake
    ament-cmake-vendor-package
    assimp
    boost
    bullet
    eigen
    fcl
    fmt
    libccd
    lz4
    ode
    tinyxml-2
    urdfdom
  ];
  propagatedBuildInputs = [
    assimp
    boost
    bullet
    eigen
    fcl
    fmt
    libccd
    lz4
    ode
    tinyxml-2
    urdfdom
  ];
  checkInputs = [
    ament-cmake-xmllint
    ament-lint-auto
    xmllintPackageHook
  ];
  nativeCheckInputs = [
    ament-xmllint
    writableTmpDirAsHomeHook
  ];

  doCheck = true;

  meta = {
    description = "Vendor package for the DART physics engine v6.13.2";
    license = with lib.licenses; [
      asl20
      bsd2
    ];
    homepage = "https://github.com/gazebo-release/gz_dartsim_vendor";
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.nim65s ];
  };
}

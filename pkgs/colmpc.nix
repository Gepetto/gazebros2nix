{
  lib,
  stdenv,

  fetchFromGitHub,

  # nativeBuildInputs
  cmake,
  pkg-config,

  # buildInputs
  llvmPackages,

  # propagatedBuildInputs
  crocoddyl,
  ipopt,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "colmpc";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "agimus-project";
    repo = "colmpc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-x64bhA9ukmRf34PMNgVlwzdazwkIP8VBfG9W/KUVVBE=";
  };

  env.NIX_CFLAGS_COMPILE = "-DCOAL_DISABLE_HPP_FCL_WARNINGS";

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = lib.optional stdenv.cc.isClang llvmPackages.openmp;

  propagatedBuildInputs = [
    crocoddyl
    ipopt
  ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_PYTHON_INTERFACE" false)
  ];

  doCheck = true;

  meta = {
    description = "Collision avoidance for MPC";
    homepage = "https://github.com/agimus-project/colmpc";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ nim65s ];
    platforms = lib.platforms.unix;
  };
})

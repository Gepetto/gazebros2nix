{
  makeSetupHook,
  writeText,
}:
makeSetupHook
  {
    name = "clean-nix-cflags-compile-hook";
  }
  (
    writeText "clean-nix-cflags-compile-hook.sh" ''
      _cleanNixCflagsCompileHook() {
        export NIX_CFLAGS_COMPILE=$(echo $NIX_CFLAGS_COMPILE | tr ' ' '\n' | grep -v '/nix/store/eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee' | tr '\n' ' ')
      }

      preConfigureHooks+=(_cleanNixCflagsCompileHook)
    ''
  )

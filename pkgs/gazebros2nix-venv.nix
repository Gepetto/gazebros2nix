{
  lib,
  python3Packages,
  callPackage,
  uv2nix,
  pyproject-nix,
  pyproject-build-systems,
}:
let
  workspace = uv2nix.lib.workspace.loadWorkspace { workspaceRoot = ../.; };
  overlay = workspace.mkPyprojectOverlay { sourcePreference = "wheel"; };
  pythonSet =
    (callPackage pyproject-nix.build.packages { inherit (python3Packages) python; }).overrideScope
      (
        lib.composeManyExtensions [
          pyproject-build-systems.overlays.default
          overlay
          (_final: prev: {
            gazebros2nix = prev.gazebros2nix.overrideAttrs (super: {
              src = lib.fileset.toSource {
                root = super.src;
                fileset = lib.fileset.unions [
                  ../pyproject.toml
                  ../README.md
                  ../src/gazebros2nix
                  ../uv.lock
                ];
              };
            });
          })
        ]
      );
  virtualenv = editablePythonSet.mkVirtualEnv "gazebros2nix-dev-env" workspace.deps.all;
  editableOverlay = workspace.mkEditablePyprojectOverlay { root = "$REPO_ROOT"; };
  editablePythonSet = pythonSet.overrideScope (
    lib.composeManyExtensions [
      editableOverlay
      (final: prev: {
        gazebros2nix = prev.gazebros2nix.overrideAttrs (super: {
          nativeBuildInputs = super.nativeBuildInputs ++ final.resolveBuildSystem { editables = [ ]; };
        });
      })
    ]
  );
  editableVirtualenv = editablePythonSet.mkVirtualEnv "gazebros2nix-editable-dev-env" workspace.deps.all;
in
pythonSet.gazebros2nix
// {
  passthru = {
    inherit editableVirtualenv virtualenv;
  };
}

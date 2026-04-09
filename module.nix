{
  flakoboros,
  nix-ros-overlay,
  nixpkgs,
  treefmt-nix,
  ...
}:
{
  config,
  lib,
  self,
  ...
}:
{
  imports = [
    treefmt-nix.flakeModule
    flakoboros.flakeModule
  ];

  config = {
    flake.overlays.gazebros2nix = lib.composeManyExtensions [
      (import ./garbage)
      (import ./generated.nix)
      (import ./todo.nix)
    ];

    flakoboros = {
      nixpkgsConfig = {
        allowUnfree = true;
        permittedInsecurePackages = [
          # SHAME
          "freeimage-3.18.0-unstable-2024-04-18"
        ];
      };
      overlays = [ self.overlays.gazebros2nix ];
    };

    perSystem =
      {
        pkgs,
        system,
        ...
      }:
      {
        treefmt = {
          # workaround  https://github.com/numtide/treefmt-nix/issues/352
          pkgs = nixpkgs.legacyPackages.${system};
          programs = {
            deadnix.enable = true;
            keep-sorted.enable = true;
            nixfmt.enable = true;
          };
        };
      };
  };
}

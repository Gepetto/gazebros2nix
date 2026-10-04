final: _prev: {
  freeimage = final.callPackage ./freeimage/package.nix { };
  ilmbase = final.callPackage ./ilmbase/package.nix { };
  libjpeg_turbo-freeimage = final.callPackage ./libjpeg_turbo-freeimage/package.nix { };
  openexr_2 = final.callPackage ./openexr_2/package.nix { };
}

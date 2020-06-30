{ supportedSystems ? [ "x86_64-linux" "x86_64-darwin" ]
} : 
let 
currentNixpkgs = import <nixpkgs> {};
in 
 {
  build = currentNixpkgs.lib.genAttrs supportedSystems (system:
    import ./default.nix {inherit system; }
    );
 }

  
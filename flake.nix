{
  description = "A flake for installing helm and related tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { 
    self, 
    nixpkgs, 
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs { inherit system; };
        buildInputs = with pkgs; [
          kustomize
          kubectl
          kubectx
          k9s
          k3d
          just
          yq-go
          kubeconform
          (wrapHelm kubernetes-helm {plugins = with kubernetes-helmPlugins; [ 
              helm-diff 
              helm-cm-push 
          ];})
          helmfile
          kn
          func
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;
        };
      }
    );
}

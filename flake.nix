{
  description = "Helm charts for Knative";

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
          yq-go
          kubeconform
          (wrapHelm kubernetes-helm {plugins = with kubernetes-helmPlugins; [
              helm-diff
              helm-cm-push
              helm-mapkubeapis
          ];})
          helmfile
          kn
          func
          chart-testing
          istioctl
          pre-commit
          codespell
          go-task
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;

          shellHook = ''
          if [ ! -f .git/hooks/pre-commit ]; then
            pre-commit install
          fi
          '';
        };
      }
    );
}

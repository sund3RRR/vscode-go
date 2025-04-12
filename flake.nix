{
  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ nodejs vsce ];
        shellHook = ''
          echo Welcome to VSCode building shell!
          echo Building vscode-go extension...
          cd extension/
          npm ci
          vsce package
        '';
      };
    };
}

with import <nixpkgs> {};

python3.pkgs.buildPythonApplication rec {
  name = "nix-sysdig";
  src = ./.;
  buildInputs = [ makeWrapper ];
  checkInputs = [ mypy ];
  checkPhase = ''
    mypy nix_sysdig
  '';
  makeWrapperArgs = [
    "--prefix PATH" ":" "${sysdig}/bin"
  ];
}

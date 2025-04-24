# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
  nativeBuildInputs = [
    pkgs.ruby
    pkgs.bundler
    pkgs.jekyll
  ];

  # Optional: Install any necessary Jekyll dependencies in the environment
  shellHook = ''
    # Make sure we are using Bundler to install gems
    export BUNDLE_PATH=${toString ./vendor/bundle}
    export PATH="$BUNDLE_PATH/bin:$PATH"
  '';
}


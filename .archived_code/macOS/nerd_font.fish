#!/usr/bin/env fish

# Cannot use brew because I'm not writing a cask for Blex.

git clone --depth=1 git@github.com:ryanoasis/nerd-fonts.git "$HOME/.nerd_fonts"

pushd "$HOME/.nerd_fonts"
./install.sh "Blex"
./install.sh "FiraCode"
popd

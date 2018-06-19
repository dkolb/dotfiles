#!/usr/bin/env fish

git clone --depth=1 git@github.com:ryanoasis/nerd-fonts.git "$HOME/.nerd_fonts"

pushd "$HOME/.nerd_fonts"
./install.sh "Blex"
popd

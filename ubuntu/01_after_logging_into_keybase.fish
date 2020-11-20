#!/usr/bin/fish

set $work_dir (mktemp -d)
pushd $work_dir

find /keybase/private/dkub/.keys/pgp/ -type f -exec gpg --import {} \;

popd
rm -rf $work_dir

git clone keybase://private/dkub/pass "$HOME/.password-store"

git clone keybase://private/dkub/dotfiles_private "$HOME/.dotfiles/private"
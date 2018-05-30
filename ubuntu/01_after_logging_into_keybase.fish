#!/usr/bin/fish

set $work_dir (mktemp -d)
pushd $work_dir

keybase pgp export -o secret.asc -s  
pgp --import secret.asc
shred secret.asc

popd
rm -rf $work_dir

git clone keybase://private/dkub/pass "$HOME/.password-store"

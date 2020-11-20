#!/usr/bin/fish

set working_dir (mktemp -d)
pushd $working_dir

curl --remote-name 'https://prerelease.keybase.io/keybase_amd64.deb'
sudo apt install ./keybase_amd64.deb

popd

rm -rf $working_dir

run_keybase

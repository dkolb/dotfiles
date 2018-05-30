#!/usr/bin/fish

set working_dir (mktemp -d)
pushd $working_dir

curl -O keybase.deb https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f

popd

rm -rf $working_dir

run_keybase

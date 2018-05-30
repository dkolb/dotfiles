#!/usr/bin/fish

set work_dir (mktemp -d)
pushd $work_dir

curl http://trial.pulsesecure.net/clients/ps-pulse-linux-5.3r3.0-b1021-ubuntu-debian-64-bit-installer.deb -o pulse_secure.deb
sudo dpkg -i pulse_secure.deb
sudo apt-get install -f libwebkitgtk-1.0.0

popd

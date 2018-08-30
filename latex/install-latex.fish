#!/usr/bin/fish
set file_dir (pushd (dirname (status -f)); pwd; popd)
set repo_root (pushd "$file_dir/../"; pwd; popd)
echo "Working with a dotfile repo_root of: $repo_root"

set working_dir (mktemp -d)
pushd $working_dir


curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz > install-tl-unx.tar.gz
tar xzvf install-tl-unx.tar.gz
cd install-tl*
./install-latex.fish --profile=ubuntu.profile

curl -L https://github.com/scottkosty/install-tl-ubuntu/raw/master/install-tl-ubuntu > install-tl-ubuntu
chmod +x install-tl-ubuntu
sudo ./install-tl-ubuntu --only-apt-and-dpkg


popd

rm -rf $working_dir

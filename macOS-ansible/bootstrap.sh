#!/bin/sh

echo "Installing homebrew..."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing ansible..."

brew install ansible

echo "Installing community ansible actions collection"
ansible-galaxy collection install community.general

echo "Installing dwsr.zgenom"
ansible-galaxy install dwsr.zgenom

echo "Installing drew-kun.nerdfonts"
ansible-galaxy install drew-kun.nerdfonts
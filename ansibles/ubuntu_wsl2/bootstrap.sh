#!/bin/sh

echo "Installing ansible..."

sudo apt update && sudo apt install ansible

echo "Installing community ansible actions collection"
ansible-galaxy collection install community.general

echo "Installing dwsr.zgenom"
ansible-galaxy install dwsr.zgenom

echo "Installing drew-kun.nerdfonts"
ansible-galaxy install drew-kun.nerdfonts
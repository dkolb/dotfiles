#!/bin/bash

RPM_FILE="tmux-3.2-1.el7.x86_64.rpm"

wget "http://galaxy4.net/repo/RHEL/7/x86_64/$RPM_FILE"

yum install -y "$RPM_FILE"

wget -cO "$HOME/.tmux.conf" 'https://raw.githubusercontent.com/dkolb/dotfiles/master/tmux/plain_tmux.conf'

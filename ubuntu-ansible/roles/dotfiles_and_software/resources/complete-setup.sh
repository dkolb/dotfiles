#!/bin/bash

run_keybase

keybase whoami

if [ "$?" -eq "2" ]; then
  echo You are not logged into keybase, running login.
  keybase login
fi

find /keybase/private/dkub/.keys/pgp/ -type f -exec gpg --import {} \;

git clone keybase://private/dkub/pass "$HOME/.password-store"

git clone keybase://private/dkub/dotfiles_private "$HOME/.dotfiles/private"
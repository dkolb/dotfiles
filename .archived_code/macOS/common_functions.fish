#!/usr/bin/env fish
function lf --description 'lf real_file link_name'
  rm -vrf $argv[2]
  ln -vs $argv[1] $argv[2]
end

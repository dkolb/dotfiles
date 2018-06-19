#!/usr/bin/env fish

function nv --description "Shortcuts for nvr"
  switch $argv[1]
    case 'l'
      nvr -l $argv[2..-1]
    case 's'
      nvr -o $argv[2..-1]
    case 'v'
      nvr -O $argv[2..-1]
    case 't'
      nvr -cc tabedit $argv[2..-1]
    case 'n'
      nvr -s -cc terminal
    case '*'
      echo 'Invalid. One of [l]ast, [s]plit, [v]split, [t]ab'\
      'or [n]ew process required.'
  end
end

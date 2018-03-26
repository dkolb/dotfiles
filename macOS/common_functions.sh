#!/bin/sh
lf() {
  rm $2
  ln -s $1 $2
}

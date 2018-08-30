#!/bin/sh
lf() {
  rm -rf $2
  ln -s $1 $2
}

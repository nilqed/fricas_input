#!/bin/sh

version=1.3.1

fpm --verbose -s tar -t deb -n fricas -v $version --license BSD \
  --category "CAS" --provides "binaries" \
  --maintainer "fricas-devel <fricas-devel@googlegroups.com>" \
  --description "https://en.wikipedia.org/wiki/FriCAS" \
  --url "http://fricas.sourceforge.net/" \
  $1
 
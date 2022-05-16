#!/usr/bin/env bash

##
##
##
INSTALL_DIR="$HOME/.cosmic/libs/shlib";
rm    -rfv             "$INSTALL_DIR";
mkdir -pv              "$INSTALL_DIR";
cp    -Rv  "./source/" "$INSTALL_DIR";
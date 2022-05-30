#!/usr/bin/env bash

echo "Clonning shlib...";
git clone https://github.com/cosmicpigdigital/shlib.git;

pushd "shlib";
    ./install.sh;
popd;


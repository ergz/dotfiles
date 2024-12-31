#!/bin/bash
set -e

cd /tmp
[ -d "ghostty" ] && rm -rf ghostty

git clone https://github.com/ghostty-org/ghostty
cd ghostty
zig build -p $HOME/.local -Doptimize=ReleaseFast
cd ..
rm -rf ghostty

#!/bin/bash
sudo apt install libgtk-4-dev libadwaita-1-dev git

set -e

cd /tmp
[ -d "ghostty" ] && rm -rf ghostty

git clone https://github.com/ghostty-org/ghostty
cd ghostty
zig build -p $HOME/.local -Doptimize=ReleaseFast
cd ..
rm -rf ghostty

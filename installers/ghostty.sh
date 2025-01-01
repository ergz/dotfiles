#!/bin/bash
sudo apt install libgtk-4-dev libadwaita-1-dev git

set -e
cd /tmp
[ -d "ghostty" ] && rm -rf ghostty
# Get the latest tag, cleaned up
LATEST_TAG=$(git ls-remote --tags --sort="v:refname" https://github.com/ghostty-org/ghostty.git | tail -n1 | sed 's/.*\///' | sed 's/\^{}//')
git clone --depth 1 --branch $LATEST_TAG https://github.com/ghostty-org/ghostty
cd ghostty
zig build -p $HOME/.local -Doptimize=ReleaseFast
cd ..
rm -rf ghostty

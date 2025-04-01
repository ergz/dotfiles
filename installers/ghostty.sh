#!/bin/bash

# Parse command line arguments
USE_MAIN=0
for arg in "$@"; do
  if [ "$arg" == "--main" ]; then
    USE_MAIN=1
  fi
done

sudo apt install libgtk-4-dev libadwaita-1-dev git

set -e
cd /tmp
[ -d "ghostty" ] && rm -rf ghostty

if [ $USE_MAIN -eq 1 ]; then
  echo "Using main branch for installation..."
  git clone --depth 1 --branch main https://github.com/ghostty-org/ghostty
else
  echo "Using latest release tag for installation..."
  # Get the latest tag, cleaned up
  LATEST_TAG=$(git ls-remote --tags --sort="v:refname" https://github.com/ghostty-org/ghostty.git | tail -n1 | sed 's/.*\///' | sed 's/\^{}//')
  git clone --depth 1 --branch $LATEST_TAG https://github.com/ghostty-org/ghostty
fi

cd ghostty
zig build -p $HOME/.local -Doptimize=ReleaseFast
cd ..
rm -rf ghostty

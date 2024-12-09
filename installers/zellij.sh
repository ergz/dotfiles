#!/bin/bash

curl -L https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz -o zellij.tar.gz
tar -xvf zellij*.tar.gz
chmod +x zellij
mv zellij ~/.local/bin/

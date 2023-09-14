#!/bin/bash

source utils/voidlinux.sh


# script error handling
set -euxo pipefail 

# make a user dirs
mkdir -p ~/{Documents,Projects,Pictures}

# copying project dirs
cp -r {.config,.dwm,.local}/ ~/
cp -r {.bashrc,.xinitrc} ~/

# build & move suckless software
cd ~/.config/suckless/dmenu-5.2
sudo make clean install
cd ~/.config/suckless/dwm-6.4
sudo make clean install
cd ~/.config/suckless/slstatus-1.0
sudo make clean install
cd ~/.config/suckless/st-0.9
sudo make clean install

# preparation lldb-debugger for helix
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
cd $(dirname $(which lldb-17))
sudo ln -s lldb-vscode-17 lldb-vscode

# move 

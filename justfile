set shell := ["bash"]

dwm:
	set -euxo pipefail
	from="dwm/*"
	to="~/.config/dwm"

	mkdir -p $to && cp -r $from $to
	sudo make clean install --makefile=dwm/Makefile

	echo "exec feh --bg-fill ~/Dotfiles/wall.png" >> ~/.xinitrc

dmenu:
	set -euxo pipefail
	from="dmenu/*"
	to="~/.config/dmenu"

	mkdir -p $to && cp -r $from $to
	sudo make clean install --makefile=dmenu/Makefile

st:
	set -euxo pipefail
	from="st/*"
	to="~/.config/st"

	mkdir -p $to && cp -r $from $to
	sudo make clean install --makefile=st/Makefile

helix:
	sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
	cd $(dirname $(which lldb-17))
	sudo ln -s lldb-vscode-17 lldb-vscode

	mkdir -p ~/.config/helix
	mv helix/* ~/.config/helix

nvim:
	from="nvim/*"
	to="~/.config/nvim/lua/user"

	git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	mkdir -p $to && cp -r $from $to

prog:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	git clone https://github.com/ronniedroid/getnf.git && cd getnf && ./install.sh
	getnf 
	wget $(lastversion )
	curl -sLO https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest/UbuntuMono.zip

ubuntu: && dwm dmenu st nvim
	set -euxo pipefail
	sudo apt install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev feh
	sudo cp X11/dwm.desktop /usr/share/xsessions/
	
	sudo add-apt-repository ppa:maveonair/helix-editor
	sudo apt update
	sudo apt install helix

	sudo add-apt-repository 

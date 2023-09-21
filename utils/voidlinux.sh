set_runit() {
  NETWORK_SV=/var/service/NetworkManager
  ELOGIND_SV=/var/service/elogind
  SDDM_SV=/var/service/sddm

  sudo xbps-install -uy NetworkManager elogind sddm

  if [ ! -d "$NETWORK_SV" ]; then      
    sudo xbps-install -uy NetworkManager 
    sudo ln -s /etc/sv/NetworkManager/ /var/service
  fi

  if [ ! -d "$ELOGIND_SV" ]; then
    sudo xbps-install -uy elogind
    sudo ln -s /etc/sv/elogind/ /var/service
  fi

  if [ ! -d "$SDDM_SV" ]; then
    sudo xbps-install -uy sddm
    sudo ln -s /etc/sv/sddm/ /var/service
  fi
}

set_de() {
  # install dev-deps for suckless
  sudo xbps-install -uy base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel cmake

  # for wallpaper setup
  sudo xbps-install -uy xwallpaper

  # creates a directory and copies files at there
  mkdir -p ~/suckless && sudo cp -r suckless/{dmenu,dwm,slstatus,st}/ "$_"

  sudo mkdir -p /usr/share/xsessions/ && sudo cp xserver/dwm.desktop "$_"
 
  # move to user tool-dirs, build, move back to project
  cd ~/suckless/dwm && sudo make clean install && cd $OLDPWD
  cd ~/suckless/dmenu && sudo make clean install && cd $OLDPWD
  cd ~/suckless/st && sudo make clean install && cd $OLDPWD
  cd ~/suckless/slstatus && sudo make clean install && cd $OLDPWD

  mkdir -p ~/{Documents,Projects,Pictures,Music}
}

set_fonts() {
  sudo xbps-install -uy font-cozette
}

set_audio() {
  sudo xbps-install -uy pipewire pulseaudio-utils wireplumber pamixer
}

get_user_deps() {
  GUI_USER_DEPS="firefox"
  TUI_USER_DEPS="git curl helix rustup python nodejs unzip"
  LIB_USER_DEPS="openssl-devel"

  sudo xbps-install -uy {$TUI_USER_DEPS,$GUI_USER_DEPS,$LIB_USER_DEPS}
  
  #git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  rustup-init -y

  # reload bashrc
  . ~/.bashrc

  rustup component add rust-analyzer
  cargo install nu
}

move_dotfiles() {
  cp -r dot-dwm ~/.dwm
  cp -r dot-config/* ~/.config/
  cp -r dot-local/* ~/.local/
  # cp -r dot-xinitrc ~/.xinitrc
  cp -r dot-bashrc ~/.bashrc
}


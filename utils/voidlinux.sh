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
  mkdir -p ~/suckless && cp -r suckless/{dmenu,dwm,slstatus,st}/ "$_"

  sudo cp xserver/dwm.desktop /usr/share/xsessions/
  
  # move to user tool-dirs, build, move back to project
  cd ~/suckless/dwm && sudo make clean install && cd $OLDPWD
  cd ~/suckless/dmenu && sudo make clean install && cd $OLDPWD
  cd ~/suckless/st && sudo make clean install && cd $OLDPWD
  cd ~/suckless/slstatus && sudo make clean install && cd $OLDPWD

  mkdir -p ~/{Documents,Projects,Pictures,Music}
}

set_fonts() {
  FONT_NAMES="CaskaydiaCoveNerdFontMono-Regular.ttf"
  FONT_NAMES_SHORT="CascadiaCode"
  FONT_PATH="/usr/share/fonts/TTF"
  URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/{$FONT_NAMES_SHORT}/Regular/{$FONT_NAMES}"
  
  # download fonts from url to system TTF-path
  cd $FONT_PATH && curl -fLOs $URL
  # back to project dir
  cd $OLDPWD
}

set_audio() {
  sudo xbps-install -uy pipewire pulseaudio-utils wireplumber pamixer
}

get_user_deps() {
  GUI_USER_DEPS="firefox"
  TUI_USER_DEPS="git curl neovim rustup python nodejs unzip"

  sudo xbps-install -uy {$TUI_USER_DEPS,$GUI_USER_DEPS}
  
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
}

move_dotfiles() {
  cp -r dot-dwm ~/.dwm
  cp -r dot-config/* ~/.config/
  cp -r dot-local/* ~/.local/
  cp -r dot-xinitrc ~/.xinitrc
  cp -r dot-bashrc ~/.bashrc
}


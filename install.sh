#!/bin/bash

# script error handling
set -euxo pipefail 

source utils/voidlinux.sh

set_runit
set_de
set_fonts
set_audio
get_user_deps
move_dotfiles

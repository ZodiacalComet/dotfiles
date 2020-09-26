################################################################################
# => XDG
################################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

################################################################################
# => Default apps
################################################################################

export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="st"
export BROWSER="qutebrowser"

################################################################################
# => Cleaning HOME
################################################################################

export LESSHISTFILE=-
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

#
# -> Rust Directories
#

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

#
# -> Ruby Directories
#

export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

#
# -> Other Directories
#

export POETRY_HOME="$XDG_DATA_HOME/poetry"
export GOPATH="$XDG_DATA_HOME/go"
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export ZDOTDIR="$HOME/.config/zsh"

################################################################################
# => Other
################################################################################
export WALLPAPER_PATH="$XDG_CACHE_HOME/wall"

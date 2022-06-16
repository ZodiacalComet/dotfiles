################################################################################
# => Environment variables
################################################################################

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

function add_to_path() {
    if [[ -d "$1" ]] ; then
        export PATH="$1:$PATH"
    fi
}

add_to_path "$CARGO_HOME/bin"
add_to_path "$POETRY_HOME/bin"
add_to_path "$XDG_DATA_HOME/npm/bin"
add_to_path "/snap/bin"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.scripts/bin"
add_to_path "$GEM_HOME/bin"
add_to_path "/usr/local/go/bin"
add_to_path "$GOPATH/bin"
add_to_path "$PERL_HOME/bin"

export BAT_THEME="Monokai Extended Bright"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

################################################################################
# => Start menu on tty1
################################################################################

if [[ "$(tty)" = "/dev/tty1" ]]; then
	$HOME/.scripts/start-menu
fi

################################################################################
# => Aliases
################################################################################

alias lc="exa -alFg --color=always --group-directories-first --git"
alias lcx="exa -x --color=always --group-directories-first"
alias lcxa="lcx -a"

alias vi="nvim"
alias vim="nvim"
alias nc="ncmpcpp"
alias sx="nsxiv"
alias sxiv="nsxiv"
alias fm="vifm"
alias ex="arc unarchive"
alias comp="arc archive"

alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

alias cat="bat"

#
# -> Fanfiction
#

alias fff="fanficfare"
alias fft="fimfic-tracker"
alias f2e="f2e-alt-cover --image-dir /tmp/f2e-alt-cover --title-font $XDG_DATA_HOME/fonts/Montserrat/Montserrat-Bold.ttf --author-font $XDG_DATA_HOME/fonts/Montserrat/Montserrat-Regular.ttf --fimfic2epub-dir $HOME/Pony/fimfiction-fanfics"

#
# -> Youtube
#

alias yv="youtube-viewer"
alias yt="yt-dlp"
alias ytv='yt-dlp --continue --add-metadata -f "mp4[height<=480]+bestaudio" -o "~/Videos/%(title)s.%(ext)s"'
alias yta='yt-dlp --continue --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/%(title)s.%(ext)s"'
alias ytal='yt-dlp --continue --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/%(artist)s - %(album)s/%(track)s.%(ext)s"'

#
# -> Going up multiple directories
#

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#
# -> Confirm before doing it
#

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#
# -> System info
#

alias df="df -h"
alias free="free -m"

alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

################################################################################
# => Starship prompt
################################################################################
eval "$(starship init zsh)"

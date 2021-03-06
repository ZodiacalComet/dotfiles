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

alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias lc="exa -alFg --color=always --group-directories-first --git"
alias lcx="exa -x --color=always --group-directories-first"
alias lcxa="lcx -a"

alias vi="vim"
alias nc="ncmpcpp"

alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

alias cat="bat"

# Frequently used commands that require to type k
alias gitch="git checkout"
alias mdir="mkdir"

#
# -> Fanfiction
#

alias fff="fanficfare"
alias fft="fimfic-tracker"
alias fft-alt="FFT_LIST=1 fft"
alias f2e="fimfic2epub-cover-patch --image-dir $XDG_CACHE_HOME/fimfic2epub-cover-patch --title-font $XDG_DATA_HOME/fonts/Montserrat/Montserrat-Bold.ttf --author-font $XDG_DATA_HOME/fonts/Montserrat/Montserrat-Regular.ttf --fimfic2epub-dir $HOME/Pony/fimfiction-fanfics"

#
# -> Youtube
#

alias yv="youtube-viewer"
alias yt="youtube-dl"
alias ytv='youtube-dl --continue --add-metadata -f "mp4[height<=480]+bestaudio" -o "~/Videos/%(title)s.%(ext)s"'
alias yta='youtube-dl --continue --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/%(title)s.%(ext)s"'
alias ytal='youtube-dl --continue --add-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/%(album_artist)s - %(album)s/%(track)s.%(ext)s"'

#
# -> Managing compressed files
#

# From:
#   Chris Titus     <https://github.com/ChrisTitusTech/zsh>
#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz)  tar xzf $1 ;;
      *.bz2)     bunzip2 $1 ;;
      *.rar)     unrar x $1 ;;
      *.gz)      gunzip $1 ;;
      *.tar)     tar xf $1 ;;
      *.tbz2)    tar xjf $1 ;;
      *.tgz)     tar xzf $1 ;;
      *.zip)     unzip $1 ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1 ;;
      *)         echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

compr() {
  local usage="Usage: compress <TYPE> <FILE>
  In which TYPE is of:
  tgz => *.tar.gz
  tbz => *.tar.bz2 zip => *.zip 7z  => *.7z
  "
  [ -z "$1" ] || [ -z "$2" ] && (echo "$usage"; exit 1)
  [ -f "$2" ] || (echo "'$2' cannot be interpreted as a file"; exit 1)
  case $1 in
    tbz) tar cvjf $2.tar.bz2 $2 ;;
    tgz) tar cvzf $2.tar.gz $2 ;;
    zip) zip -r $2.zip $2 ;;
    7z)  7z a $2.7z $2 ;;
    *)   echo "$usage" && return 1 ;;
  esac
}

#
# -> Going up multiple directories
#

alias ..="cd .."
alias ...="cd ../.."

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

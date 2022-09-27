################################################################################
# => Environment variables
################################################################################

source $HOME/.config/zsh/path.zsh

export BAT_THEME="Monokai Extended Bright"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

################################################################################
# => Aliases
################################################################################

alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias sxiv="nsxiv"

alias sx="nsxiv"
alias nc="ncmpcpp"
alias fm="vifm"

alias lc="exa -alFg --color=always --group-directories-first --git"
alias lcx="exa -x --color=always --group-directories-first"
alias lcxa="lcx -a"
alias ex="arc unarchive"
alias comp="arc archive"

alias todo='rg "(TODO|NOTE):"'

alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

#
# -> Fanfiction
#

alias fff="fanficfare"
alias fft="fimfic-tracker"

f2e() {
	for ID in $@; do
		echo "   :: ID: $ID";
		f2e-alt-cover \
			--image-dir /tmp/f2e-alt-cover \
			--title-font "$XDG_DATA_HOME/fonts/Montserrat/Montserrat-Bold.ttf" \
			--author-font "$XDG_DATA_HOME/fonts/Montserrat/Montserrat-Regular.ttf" \
			--fimfic2epub-dir "$HOME/Pony/fimfiction-fanfics" \
			"$ID";
	done
}

#
# -> Entertainment
#

alias yv="youtube-viewer"
alias ma="mpv --profile=ytdl-audio"

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

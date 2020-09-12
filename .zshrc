################################################################################
# => Powerlevel10k prompt
################################################################################

source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################################################################################
# => PATH
################################################################################

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

function add_to_path() {
    if [[ -d "$1" ]] ; then
        export PATH="$PATH:$1"
    fi
}

add_to_path "$HOME/.poetry/bin"
add_to_path "$HOME/.local/bin"

export XDG_CONFIG_HOME="$HOME/.config"

# Personal scripts to expose
add_to_path "$HOME/.scripts/bin"

# Gem installation directory
export GEM_HOME="$HOME/gems"
add_to_path "$HOME/gems/bin"

################################################################################
# => Aliases
################################################################################

alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias download-video='youtube-dl --continue -f "mp4[height<=480]+bestaudio" -o "~/Videos/Youtube-DL/[%(extractor)s] %(uploader)s/%(title)s.%(ext)s"'
alias download-audio='youtube-dl --continue --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/Youtube-DL/[%(extractor)s] - [%(uploader)s] - %(title)s.%(ext)s"'

alias lc="exa -alFg --color=always --group-directories-first --git"
alias vimwiki="vim ~/vimwiki/index.wiki"

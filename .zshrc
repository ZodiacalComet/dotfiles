# Load powerlevel10k prompt
source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##########################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

##########################################################

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias download-video='youtube-dl --continue -f "mp4[height<=480]+bestaudio" -o "~/Videos/Youtube-DL/[%(extractor)s] %(uploader)s/%(title)s.%(ext)s"'
alias download-audio='youtube-dl --continue --extract-audio --audio-format mp3 --audio-quality 0 -o "~/Music/Youtube-DL/[%(extractor)s] - [%(uploader)s] - %(title)s.%(ext)s"'

alias lc="exa -alFg --color=always --group-directories-first --git"
alias vimwiki="vim ~/vimwiki/index.wiki"

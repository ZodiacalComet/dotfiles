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
add_to_path "$XDG_DATA_HOME/nimble/bin"

fpath=(
    "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions"  # also set by brew shellenv, but only in login shells
    $fpath
    "$HOME/.local/share/zsh/site-functions"                       # generated, not tracked (e.g. openspec)
    "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-completions"
)

# cached compinit, rebuilt from scratch once a day to pick up new completions
autoload -Uz compinit
() {
    if (( $# )); then
        command rm -f ~/.zcompdump
        compinit -u -d ~/.zcompdump
    else
        compinit -u -C -d ~/.zcompdump
    fi
} ~/.zcompdump(N.mh+24)

# menu with arrow-key selection, case-insensitive and partial-word matching
zmodload -i zsh/complist
setopt always_to_end auto_menu complete_in_word
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:*:users' ignored-patterns '_*'  # macOS system accounts
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true

ZSH_THEME=""  # using starship instead
plugins=(git gitignore)

fpath=(
    "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions"  # also set by brew shellenv, but only in login shells
    $fpath
    "${ZSH_CUSTOM:-$ZSH/custom}/completions"                      # e.g. openspec
    "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src"
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

# OMZ would run compinit a second time: stub it out while OMZ loads, then restore
compinit()  { : }
compaudit() { : }
zrecompile() { : }

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
else
    print -u2 "oh-my-zsh not found in $ZSH, see $DOTFILES/README.md"
fi

unfunction compinit compaudit zrecompile
autoload -Uz compinit compaudit zrecompile

AUTOSUGGESTIONS="${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -r "$AUTOSUGGESTIONS" ]] && source "$AUTOSUGGESTIONS"
unset AUTOSUGGESTIONS

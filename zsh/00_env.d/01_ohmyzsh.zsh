ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true

ZSH_THEME=""  # using starship instead
plugins=(git gitignore)

fpath+=${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src
fpath+=$HOME/.docker/completions
source $ZSH/oh-my-zsh.sh

# extra plugins
BREW_PREFIX="/opt/homebrew"
[[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# defer syntax highlighting to load in background after prompt
[[ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && () { source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" } &!

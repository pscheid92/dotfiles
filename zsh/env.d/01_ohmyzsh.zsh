ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true

ZSH_THEME=fishy
plugins=(git gitignore ripgrep)

fpath+=${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# extra plugins (consider zsh-defer to load them later)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

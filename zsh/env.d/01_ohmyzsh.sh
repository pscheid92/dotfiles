## Activate oh-my-zsh

# Prepare
ZSH='/Users/pscheid/.oh-my-zsh/'
DISABLE_AUTO_UPDATE='true'
ZSH_CACHE_DIR="$HOME/.oh-my-zsh/cache-dir"
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir $ZSH_CACHE_DIR
fi

# Loading theme
ZSH_THEME="fishy"

# Plugins list
plugins=(asdf docker fzf golang git gitignore ripgrep)

# extend fpath
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Load startup script
source $ZSH/oh-my-zsh.sh

# Deactivate options from oh-my-zsh
unsetopt autopushd

# Load additional plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

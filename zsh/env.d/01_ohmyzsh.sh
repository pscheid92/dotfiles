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
plugins=(asdf docker fzf golang git gitfast gitignore ripgrep)

# Load startup script
source $ZSH/oh-my-zsh.sh

# Deactivate options from oh-my-zsh
unsetopt autopushd

## Activate oh-my-zsh

# Prepare
ZSH='/home/pscheid/.oh-my-zsh/'
DISABLE_AUTO_UPDATE='true'
ZSH_CACHE_DIR="$HOME/.oh-my-zsh/cache-dir"
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir $ZSH_CACHE_DIR
fi

# Loading theme
ZSH_THEME="fishy"

autoload -U zmv

# Plugins list
plugins=(command-not-found compleat docker git git-extras git-flow-avh gitignore gradle mvn npm pip python pylint sbt scala sudo systemd wd zmv zsh-syntax-highlighting)

# Load startup script
source $ZSH/oh-my-zsh.sh

# Deactivate options from oh-my-zsh
unsetopt autopushd

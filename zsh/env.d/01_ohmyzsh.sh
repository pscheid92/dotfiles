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

# Plugins list
plugins=(asdf command-not-found compleat docker golang git git-extras gitignore gradle systemd)

# Load startup script
source $ZSH/oh-my-zsh.sh

# Deactivate options from oh-my-zsh
unsetopt autopushd


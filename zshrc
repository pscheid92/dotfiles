# Reading profile.d
source /etc/profile

# Setting dotfile folder
DOTFILES=$HOME/.dotfiles

# Reading in zsh configuration
for FILE in $DOTFILES/zsh/**/*; do
    [ -f "$FILE" ] && source "$FILE"
done

# Exporting
export DOTFILES

# Activate completion cache for packages
zstyle ':completion::complete:*' use-cache 1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

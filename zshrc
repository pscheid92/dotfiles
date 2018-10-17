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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/pscheid/.sdkman"
[[ -s "/home/pscheid/.sdkman/bin/sdkman-init.sh" ]] && source "/home/pscheid/.sdkman/bin/sdkman-init.sh"

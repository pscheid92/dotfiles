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


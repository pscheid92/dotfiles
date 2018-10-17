#!/usr/bin/env sh

# Setting runtime variables
GITHUB="https://github.com/pscheid92/dotfiles.git"
DOTFILES="$HOME/.dotfiles"

# Create folder if not exist
[[ ! -d $DOTFILES ]] && git clone $GITHUB $DOTFILES

# Create default symbolic links
ln "$DOTFILES/zshrc" -s "$HOME/.zshrc"
ln "$DOTFILES/git/.gitconfig" -s "$HOME/.gitconfig"
ln "$DOTFILES/bin/" -s "$HOME/.bin/"
ln "$DOTFILES/zprofile" -s "$HOME/.zprofile"


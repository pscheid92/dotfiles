# fzf key bindings: ^R history, ^T files, Alt-C cd into a subdirectory.
# Loaded after 06_options_keys.zsh so these keys end up with fzf.
[[ -n $TTY ]] && (( $+commands[fzf] )) && source <(fzf --zsh)  # needs a terminal for zle

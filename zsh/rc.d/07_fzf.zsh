# fzf key bindings: ^R history, ^T files, Alt-C cd into a subdirectory.
# Loaded after 06_options_keys.zsh so these keys end up with fzf. zle needs a
# terminal, so skip this in `zsh -ic` runs without one.
if [[ -n $TTY ]] && (( $+commands[fzf] )); then
    source <(fzf --zsh)
    # Alt-C needs Option as Esc+ in iTerm2, but the German layout needs Option for @ [ ] { } | ~
    bindkey '^G' fzf-cd-widget
fi

# fnm: Node version manager, switches versions on cd (.nvmrc, .node-version).
# Never cache this output: `fnm env` creates a separate multishell dir for each
# shell, so a frozen copy makes all terminals share one active Node version.
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --shell zsh)"

# direnv: loads a directory's .envrc on cd, once allowed with `direnv allow`
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

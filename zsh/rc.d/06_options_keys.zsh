# Options and key bindings (formerly set by oh-my-zsh)

setopt auto_cd               # type a directory name to cd into it
setopt auto_pushd            # cd keeps a directory stack (cd -<Tab>)
setopt pushd_ignore_dups
setopt pushdminus
setopt interactive_comments  # allow # comments on the command line
setopt long_list_jobs
setopt multios               # echo foo >a >b
unsetopt flow_control        # free ^S and ^Q

WORDCHARS=''                 # ^W and Alt-Backspace stop at / . - _

# emacs keymap; Up/Down search the history for what's already typed
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^[[A' up-line-or-beginning-search    # Up
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search  # Down
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[H' beginning-of-line              # Home
bindkey '^[OH' beginning-of-line
bindkey '^[[F' end-of-line                    # End
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char                   # Delete
bindkey '^[[3;5~' kill-word                   # Ctrl-Delete
bindkey '^[[1;5C' forward-word                # Ctrl-Right
bindkey '^[[1;5D' backward-word               # Ctrl-Left
bindkey '^[[Z' reverse-menu-complete          # Shift-Tab
bindkey ' ' magic-space                       # expand !! and friends on space
bindkey '^X^E' edit-command-line              # edit the command line in $EDITOR

# quote URLs while typing or pasting them (? & ...)
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# terminal title: the running command, otherwise the current directory
autoload -Uz add-zsh-hook
_title_precmd()  { print -Pn '\e]0;%~\a' }
_title_preexec() { print -n "\e]0;${1[(w)1]}\a" }
add-zsh-hook precmd _title_precmd
add-zsh-hook preexec _title_preexec

AUTOSUGGESTIONS="${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -r "$AUTOSUGGESTIONS" ]] && source "$AUTOSUGGESTIONS"
unset AUTOSUGGESTIONS

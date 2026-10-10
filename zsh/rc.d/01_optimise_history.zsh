# Optimise history
# see: https://martinheinz.dev/blog/110

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

HISTORY_IGNORE="(ls|cd|pwd|exit)(| *)"

# not exported: a bash started from zsh would otherwise write into the zsh history
typeset +x HISTFILE HISTSIZE SAVEHIST HISTORY_IGNORE

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY         # Share history between all sessions, writing each command immediately.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

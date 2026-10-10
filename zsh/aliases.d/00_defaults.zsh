# Defaults
alias cp="cp -i"	    # confirm before overwriting
alias df="df -h"	    # use human-readable sizes
alias mkdir='mkdir -p'  # mkdir allow deeper folder creation

# Navigation
alias -- -='cd -'       # back to the previous directory
alias -g ...='../..'
alias -g ....='../../..'

# Set terminal coloring
alias grep='grep --color=auto' 	 # Coloring grep

# Improve listing
alias ls='eza'          # use eza
alias la='eza -a'       # show also hidden files
alias ll='eza -lh'      # long list with human-readable sizes, symlinks shown as link -> target
alias lla='eza -alh'    # the same, hidden files included
alias l='lla'

# whole history, not just the last 16 entries
alias history='fc -l 1'

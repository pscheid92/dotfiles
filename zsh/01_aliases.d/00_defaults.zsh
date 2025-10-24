# Defaults
alias cp="cp -i"	    # confirm before overwriting
alias df="df -h"	    # use human-readable sizes
alias free="free -m"    # show sizes in MB
alias rm='rm -I'	    # Make rm save
alias mkdir='mkdir -p'  # mkdir allow deeper folder creation

# Set terminal coloring
alias grep='grep --color=auto' 	 # Coloring grep
alias egrep='egrep --color=auto' # Coloring egrep
alias fgrep='fgrep --color=auto' # Coloring fgrep

# Improve listing
alias ls='eza'          # use eza
alias la='eza -a'       # show also hidden files
alias ll='eza -lhX'     # list files with human-readable sizes without resolving sym-links
alias lla='eza -alhX'   # list all files with human-readable sizes without resolving sym-links

# wrapper scripts in ~/.dotfiles/bin (e.g. aws) come before Homebrew on PATH,
# also for scripts and tools started from this session; keep this module last
path=("$DOTFILES/bin" $path)

# Personal binaries (uv's python shims and tools, claude, ...) come before the
# system ones, so ~/.local/bin/python3 wins over Apple's /usr/bin/python3
path=("$HOME/.local/bin" $path)

## Create own shell functions

# Create a new directory and enter it
# Source: github.com/mathiasbynens/dotfiles
function mk() {
	mkdir -p "$@" && cd "$@"
}

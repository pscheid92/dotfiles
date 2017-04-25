## Create function to lazy load sdkman

# Function tests if sdk is alreay loaded
# If not, load it and run the command
# If already loaded, skip the loading.

function sdkman() {

	# If not alreay loaded, load sdkman
	if [ -z "$SDKMAN_DIR" ]; then
		export SDKMAN_DIR="$HOME/.sdkman"
		[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source ""$SDKMAN_DIR/bin/sdkman-init.sh""
	fi

	# Call loaded sdk function
	sdk $@
}

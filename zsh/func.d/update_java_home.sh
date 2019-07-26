# Create a method to update the current JAVA_HOME variable
function update_java_home() {
	export JAVA_HOME=$(asdf where java)
}

# Create a shortcut
alias ujh=update_java_home


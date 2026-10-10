# Go reads GOPATH (~/Projects/Go) from its own config file, which `install`
# writes with go env -w, so shells and apps started outside one agree.
# Only binaries installed with `go install` need to go on PATH.
path+=("$HOME/Projects/Go/bin")

# Setting R for RStudio
export RSTUDIO_WHICH_R=/usr/lib64/microsoft-r/3.4/lib64/R/bin/R

# Setting GO in PATH
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Projects/.go
export PATH=$PATH:$GOPATH/bin

# Load sdk
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source ""$SDKMAN_DIR/bin/sdkman-init.sh""


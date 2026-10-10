# Load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# disable cleanup hint for brew
export HOMEBREW_NO_ENV_HINTS=1

# Lookup homebrew for shared libraries.
export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:/usr/local/lib:/usr/lib"

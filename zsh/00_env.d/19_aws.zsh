# Homebrew's python@3.14 links its XML module (pyexpat) against macOS's
# /usr/lib/libexpat, which on macOS 26.0 lacks a function the bottle needs,
# so every aws command that parses XML (all of S3) fails. Homebrew's expat
# (keg-only) has it. Delete this file once `command aws s3 ls` works on its
# own again, after a macOS or python@3.14 update.
aws() {
    DYLD_LIBRARY_PATH="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/expat/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}" command aws "$@"
}

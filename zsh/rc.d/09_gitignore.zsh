# gi go,macos > .gitignore: .gitignore templates from gitignore.io
gi() {
    curl -sfL "https://www.toptal.com/developers/gitignore/api/${(j:,:)@}"
}

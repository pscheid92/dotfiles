# dotfiles

zsh, git, ssh, vim, starship and Claude Code configuration for macOS on Apple
silicon with Homebrew.

## Setup on a new Mac

1. Install [Homebrew](https://brew.sh), then everything in the `Brewfile`:

   ```sh
   git clone git@github.com:pscheid92/dotfiles.git ~/.dotfiles
   brew bundle --file ~/.dotfiles/Brewfile
   ```

2. Link the configs into your home directory. A file that differs from the repo
   version is first moved to `<name>.backup-<timestamp>`.

   ```sh
   ~/.dotfiles/install
   ```

3. Put machine-specific settings and secrets in these files. They are read by
   the tracked configs but are not part of this repo:

   - `~/.zshrc.local`: sourced by `.zshrc`
   - `~/.gitconfig.local`: included by `.gitconfig` (e.g. a work email)
   - `~/.ssh/config.local`: included by `.ssh/config` (servers)

## Layout

- `configs/`: files that `install` links into `$HOME`
- `zsh/profile.d/`: environment (`PATH`, tool homes, `EDITOR`, ...), sourced in
  order by `.zprofile` once per login shell and inherited by everything started
  from it, including `zsh -lc` commands
- `zsh/rc.d/`: interactive setup (completion, options, key bindings, prompt,
  history, hooks, functions), sourced in order by `.zshrc`
- `zsh/aliases.d/`: aliases, sourced by `.zshrc` after `rc.d/`
- `bin/`: wrapper scripts, ahead of Homebrew on `PATH`
- `Brewfile`: Homebrew taps, formulae, casks and uv tools (VS Code, npm, cargo
  and krew entries need their tools installed first). Refresh with:

  ```sh
  brew bundle dump --force --file=- | grep -vE '^(vscode|npm|cargo|krew|go) ' > ~/.dotfiles/Brewfile
  ```

  The dump only lists apps Homebrew manages: take over a manually installed one
  with `brew install --cask --adopt <name>` first. `expat` looks unused, but
  `bin/aws` needs it.

Where a new setting goes: if child processes should inherit it (`export`,
`PATH`), it belongs in `profile.d/`. If it only matters while you type
(`setopt`, `alias`, functions, completion, prompt, hooks), it belongs in
`rc.d/` or `aliases.d/`. `.zshenv` runs for every zsh, scripts included, so it
stays nearly empty.

## Notes

- No zsh framework: completion, options and key bindings live in `zsh/rc.d/`,
  and the plugins (autosuggestions, syntax highlighting, zsh-completions) come
  from Homebrew.
- Completions come from Homebrew's `share/zsh/site-functions` and
  zsh-completions and are loaded on the first <kbd>Tab</kbd>. Don't paste the
  output of `tool completion zsh` or `tool init zsh` into this repo: it goes
  stale, and some of it (like `fnm env`) is per-shell state. A tool that can only
  generate its completion writes it to `~/.local/share/zsh/site-functions/_tool`.
- The completion cache is rebuilt once a day. To pick up a new tool's
  completions right away: `rm ~/.zcompdump && exec zsh`.
- fzf: <kbd>Ctrl</kbd>-<kbd>R</kbd> history, <kbd>Ctrl</kbd>-<kbd>T</kbd> files,
  <kbd>Ctrl</kbd>-<kbd>G</kbd> (or <kbd>Alt</kbd>-<kbd>C</kbd>) cd into a
  subdirectory. Alt only works with iTerm2's Option key set to Esc+, which the
  German layout needs for `@ [ ] { } | ~`.
- `~/.claude/settings.json` is a symlink into this repo. If Claude Code ever
  replaces it with a regular file, run `install` again (it keeps the file as a
  backup) and merge the difference.

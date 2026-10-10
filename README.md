# dotfiles

zsh, git and starship configuration for macOS on Apple silicon with Homebrew.

## Setup on a new Mac

1. Install [Homebrew](https://brew.sh), then everything in the `Brewfile`:

   ```sh
   git clone git@github.com:pscheid92/dotfiles.git ~/.dotfiles
   brew bundle --file ~/.dotfiles/Brewfile
   ```

2. Install oh-my-zsh and the zsh-completions plugin:

   ```sh
   git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
   git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
   ```

3. Link the configs into your home directory. A file that differs from the repo
   version is first moved to `<name>.backup-<timestamp>`.

   ```sh
   ~/.dotfiles/install
   ```

4. Put secrets and machine-specific settings in `~/.zshrc.local`. It is sourced
   by `.zshrc` and not part of this repo.

## Layout

- `configs/`: files that `install` links into `$HOME`
- `zsh/profile.d/`: environment (`PATH`, tool homes, `EDITOR`, ...), sourced in
  order by `.zprofile` once per login shell and inherited by everything started
  from it, including `zsh -lc` commands
- `zsh/rc.d/`: interactive setup (completion, prompt, history, hooks,
  functions), sourced in order by `.zshrc`
- `zsh/aliases.d/`: aliases, sourced by `.zshrc` after `rc.d/`
- `bin/`: wrapper scripts, ahead of Homebrew on `PATH`

Where a new setting goes: if child processes should inherit it (`export`,
`PATH`), it belongs in `profile.d/`. If it only matters while you type
(`setopt`, `alias`, functions, completion, prompt, hooks), it belongs in
`rc.d/` or `aliases.d/`. `.zshenv` runs for every zsh, scripts included, so it
stays nearly empty.
- `Brewfile`: Homebrew taps, formulae and casks only (VS Code, npm, cargo, krew
  and uv entries need their tools installed first). Refresh with:

  ```sh
  brew bundle dump --force --file=- | grep -vE '^(vscode|npm|cargo|krew|uv|go) ' > ~/.dotfiles/Brewfile
  ```

## Notes

- Completions come from Homebrew's `share/zsh/site-functions` and are loaded on
  the first <kbd>Tab</kbd>. Don't paste the output of `tool completion zsh` or
  `tool init zsh` into this repo: it goes stale, and some of it (like `fnm env`)
  is per-shell state.
- The completion cache is rebuilt once a day. To pick up a new tool's
  completions right away: `rm ~/.zcompdump && exec zsh`.
- oh-my-zsh doesn't update itself here. Run `omz update` now and then.

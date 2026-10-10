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

3. In 1Password → Settings → Developer, turn on **Use the SSH agent** and
   **Integrate with 1Password CLI**. SSH keys live in 1Password, and git signs
   every commit and tag with the key in `user.signingkey`: commits fail until
   the agent is running.

4. Put machine-specific settings and secrets in these files. They are read by
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
stays empty.

## How it works

### Shell startup

zsh reads three files, all symlinks into `configs/`:

| File | Read by | Does |
|---|---|---|
| `.zshenv` | every zsh, scripts included | nothing, on purpose |
| `.zprofile` | login shells, i.e. every new terminal tab | sources `zsh/profile.d/*.zsh` in order |
| `.zshrc` | interactive shells | sources `zsh/rc.d/*.zsh`, then `zsh/aliases.d/*.zsh`, then `~/.zshrc.local`, then syntax highlighting (has to be last) |

The number in a file name only sets the order. `PATH` is the list of
directories searched for a command, first match wins: `whence -ap <command>`
shows every copy and which one runs.

### `zsh/profile.d/`: PATH and environment

| File | Does |
|---|---|
| `00_homebrew` | Homebrew's `bin` and `sbin` |
| `01_go` | `~/Projects/Go/bin`, where `go install` puts programs. GOPATH itself is in Go's config file (`go env -w`, run by `install`), so apps started outside a shell use it too |
| `02_local_bin` | `~/.local/bin` first: uv's `python3`, uv tools, `claude` |
| `03_rust` | `~/.cargo/bin`: cargo, rustc and tools from `cargo install` |
| `04_orbstack` | OrbStack's `docker`, `kubectl`, ... |
| `05_editors_and_pager` | vim as editor; `less` exits right away when the output fits on one screen |
| `06`–`08` | .NET tools, krew, pnpm |
| `09_fzf` | how fzf lists files: `fd`, hidden files included, `.git` and gitignored paths left out, `bat` preview |
| `10_dotfiles_bin` | `bin/` in front of everything (the `aws` wrapper) |

### `zsh/rc.d/`: interactive shell

| File | Does |
|---|---|
| `00_completion` | <kbd>Tab</kbd> completion: where the definitions live (`fpath`), a `compinit` cache rebuilt daily, an arrow-key menu, case-insensitive and mid-word matching |
| `01_optimise_history` | 100,000 entries shared between all tabs, no duplicates. A command that starts with a space isn't saved |
| `02_zoxide` | `z <part of a path>` jumps to a directory you use often, `zi` picks from a list |
| `03_starship` | the prompt (`configs/starship.toml`) |
| `04_fnm` | switches the Node version on `cd` (`.nvmrc`, `.node-version`) |
| `05_pdfcompress` | `pdfcompress file.pdf` writes `file_compressed.pdf` |
| `06_options_keys` | type a directory name to `cd` into it; key bindings; URLs quoted while pasting; tab title; grey autosuggestions from the history |
| `07_fzf` | fuzzy search key bindings |
| `08_direnv` | loads a directory's `.envrc` on `cd` and unloads it when you leave |
| `09_gitignore` | `gi go,macos > .gitignore` fetches templates from gitignore.io |

### Keys and shortcuts

| Key or command | Does |
|---|---|
| <kbd>Ctrl</kbd>-<kbd>R</kbd> | fuzzy-search the history |
| <kbd>Ctrl</kbd>-<kbd>T</kbd> | fuzzy-pick a file and paste its path |
| <kbd>Ctrl</kbd>-<kbd>G</kbd> | fuzzy-jump into a subdirectory. fzf's usual <kbd>Alt</kbd>-<kbd>C</kbd> needs iTerm2's Option key set to Esc+, but the German layout needs Option for `@ [ ] { } \| ~` |
| <kbd>↑</kbd> / <kbd>↓</kbd> | history entries that start with what's already typed |
| <kbd>→</kbd> | accept the grey autosuggestion |
| <kbd>Ctrl</kbd>-<kbd>X</kbd> <kbd>Ctrl</kbd>-<kbd>E</kbd> | edit the command line in vim |
| `!!` + <kbd>Space</kbd> | expands to the previous command before you run it |
| `-` | back to the previous directory; `cd -<Tab>` lists recent ones |
| `...`, `....` | two, three directories up |
| `ll`, `lla` (or `l`), `la` | long list, long list with hidden files, names with hidden files |
| `k` | `kubectl`, with its completion |
| `ga` `gc` `gd` `gp` `gss` `glola` | git add, commit, diff, push, short status, graph of all branches |

While you type, syntax highlighting shows a command in green if it exists and in
red if it doesn't.

### Git

Besides name and email, `configs/gitconfig` sets:

- `git pull` rebases instead of creating merge commits, `fetch` removes
  branches deleted on the remote, and a rebase stashes uncommitted changes and
  puts them back afterwards.
- Conflicts show the common ancestor next to both sides (`zdiff3`), and git
  replays resolutions it has seen before (`rerere`).
- Diffs go through delta: syntax highlighting, <kbd>n</kbd>/<kbd>N</kbd> jump
  between files. `git branch` lists the most recently used branch first.
- Every commit and tag is signed with the SSH key in 1Password. GitHub shows
  them as Verified; `allowed_signers` lets `git log --show-signature` check
  them locally.

### 1Password, SSH and secrets

- SSH keys live in 1Password, not in `~/.ssh`. `ssh` and commit signing ask its
  agent for them, hence the occasional Touch ID prompt. The `.pub` files stay
  in `~/.ssh` so an `IdentityFile` line can still pick a key.
- `~/.ssh/config` only has what every machine shares; servers go in
  `~/.ssh/config.local`.
- API keys live in 1Password, not in `~/.zshrc.local`. A project that needs one
  loads it with direnv: put
  `export GEMINI_API_KEY="$(op read 'op://Personal/Gemini API/credential')"` in
  its `.envrc` and run `direnv allow`. Copy a field's `op://` path with
  "Copy Secret Reference" in 1Password.

### Python

- One Python: uv's (`python3` in `~/.local/bin`). For a project:
  `uv init`, `uv add <package>`, `uv run`.
- Python programs are uv tools (`uv tool install pgcli`), each in its own
  environment, and listed in the `Brewfile` as `uv "..."` entries.
- Homebrew's Python programs are avoided for now: on macOS 26 its python@3.14
  can't load XML support. `aws` is the exception (AWS CLI v2 isn't on PyPI),
  hence the wrapper in `bin/`.

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
- `~/.claude/settings.json` is a symlink into this repo. If Claude Code ever
  replaces it with a regular file, run `install` again (it keeps the file as a
  backup) and merge the difference.

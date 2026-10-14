# Repository guidance

## Purpose

This repository is a personal dotfiles and configuration backup. The current maintenance task is to bring the repository's tracked configs into sync with the configuration on this Mac, then review and commit the intentional changes so they can be pushed to `origin` as a backup. For this sync, the local machine's current config is the source of truth unless the user says otherwise.

This is primarily a backup workflow, not an instruction to install or deploy configs onto the machine. Do not overwrite local settings with repository versions as part of syncing local changes into the repo.

## Configs in scope

Prioritize the user's named configs and inspect the actual local paths before copying:

- `herdr/` — currently contains `config.toml`.
- `tmux/` — currently contains `.tmux.conf`.
- Kaku (a WezTerm spinoff) — inspect `wezterm/` and any Kaku-specific local config before deciding which files correspond. The tmux config references Kaku integration at `~/.config/kaku/tmux/kaku.tmux.conf`; do not assume this is the main Kaku config.
- macOS shell settings — currently stored under `osx/`, including `.zshrc`, `.aliases`, and `.functions`.
- Other macOS configs — include only additional settings that are clearly part of the requested sync or that the user explicitly asks to include.

Repository filenames/directories are not necessarily identical to their local paths. Check symlinks, include/source directives, and app-specific config locations when establishing each mapping. Never guess a local path and copy blindly.

## Sync workflow

1. Check `git status` first. Preserve unrelated user changes; do not reset, stash, or overwrite them.
2. Inspect both the relevant repository files and their local machine counterparts. Compare before editing, and identify whether differences are intended local updates, repo-only changes, or machine-specific state.
3. Copy or manually merge only the requested, intentional local changes into the matching repository files. Keep existing repo structure and naming unless there is a clear reason to change them.
4. Review the resulting diff (`git diff --check` and `git diff`) for accidental changes, machine-specific paths, generated state, and secrets. Do not commit or push unless asked.
5. Report which local files were mapped to which repo files, what changed, anything skipped or ambiguous, and any verification performed.

Treat credentials, tokens, private keys, host-specific secrets, caches, logs, and generated/runtime state as out of scope. Do not add them to the repo; if a config contains them, redact or omit them and tell the user.

## Existing scripts and directionality

`osx/sync.sh` currently syncs repository content **to** the home directory (using `rsync`), and runs `git pull` before doing so. It is not a safe tool for importing local changes into the repository. Do not run it for the local-to-repo backup task. `osx/initialize.sh` installs software and invokes that deployment script; do not run it for this task.

## General conventions

- Keep changes focused on dotfiles and their documentation; avoid unrelated cleanup.
- Preserve comments and local conventions in existing config files.
- Do not assume a build or test suite exists for configuration files. Run relevant syntax/format checks only when available and safe, and state what was not checked.
- When the user asks to publish the backup, follow the repository's configured `origin`; do not change remotes or account identity without asking. For personal SSH repositories under `github.me` or `trongthanh`, use the `trongthanh` account; for work repositories on `github.com` under `carousell`, use `thanhtran-ct`.

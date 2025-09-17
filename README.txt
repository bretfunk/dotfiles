DOTFILES MANAGEMENT
==================

This directory contains configuration files that are synced across machines via Git.
All files here are the SOURCE OF TRUTH and should be symlinked to their proper locations.

CURRENT SYMLINKS
================

The following files are properly symlinked:

1. ~/.zshrc -> /Users/bretfunk/dotfiles/zshrc
   Shell configuration and aliases

2. ~/.config/starship.toml -> /Users/bretfunk/dotfiles/starship.toml
   Starship prompt configuration

3. ~/.config/nvim/lua/plugins/elixir.lua -> /Users/bretfunk/dotfiles/elixir.lua
   Neovim Elixir plugin configuration with Expert LSP

4. ~/.iex.exs -> /Users/bretfunk/dotfiles/iex.exs
   Elixir interactive shell configuration

ADDING NEW DOTFILES
===================

To add a new dotfile to this system:
1. Move the config file to this directory
2. Create a symlink from the original location to this directory
3. Commit and push the changes

Example:
  mv ~/.some_config ./some_config
  ln -s /Users/bretfunk/dotfiles/some_config ~/.some_config

EXPERT LSP (LEXICAL) UPDATE INSTRUCTIONS
========================================

The elixir.lua file configures Expert LSP for Elixir development.
Expert is the official Elixir Language Server Protocol implementation.

To update Expert LSP:

1. Download latest release from: https://github.com/elixir-lang/expert/releases
2. Replace the binary at: /Users/bretfunk/.local/bin/expert
3. Make sure it's executable: chmod +x /Users/bretfunk/.local/bin/expert

Alternative update methods:

Using GitHub CLI (for nightly builds):
  gh release download nightly --pattern 'expert_*' --repo elixir-lang/expert

Building from source (requires Zig 0.14.1):
  git clone https://github.com/elixir-lang/expert.git
  cd expert
  zig build -Doptimize=ReleaseSafe
  # Binary will be in apps/expert/burrito_out/

Requirements:
- Erlang 24+
- Elixir 1.13+
- The Expert binary supports Elixir 1.17 and Erlang 27

TROUBLESHOOTING
===============

If Expert LSP isn't working:
1. Check the binary exists: ls -la /Users/bretfunk/.local/bin/expert
2. Verify it's executable: chmod +x /Users/bretfunk/.local/bin/expert
3. Test the binary: /Users/bretfunk/.local/bin/expert --version
4. Check Neovim LSP logs: :LspLog in Neovim

For symlink issues:
- Check if symlink exists: ls -la ~/.config_file
- Recreate if broken: rm ~/.config_file && ln -s /Users/bretfunk/dotfiles/config_file ~/.config_file
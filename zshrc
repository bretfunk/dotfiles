# =============================================================================
# SYSTEM NOTES
# =============================================================================
# Editor: Neovim (LazyVim) with Expert LSP for Elixir
# Version Manager: ASDF (handles Elixir, Node, Python, etc.)
# Terminal: Ghostty
# Keyboard: Karabiner (Caps Lock → Escape/Control)
# Package Manager: Homebrew (cleaned regularly)
# =============================================================================

# Essential aliases
alias 'cdu=cd ~/Documents/code/ucbi/ucbi_dev && ls -la'
alias 'cds=cd ~/Documents/code/projects/service_amplify && ls -la'
alias 'dotfiles=cd ~/dotfiles && ls -la'
alias 'v=nvim'
alias 'lg=lazygit'

# Editor
export EDITOR='nvim'

# PATH setup (minimal)
export PATH="/opt/homebrew/bin:$PATH"  # Homebrew (nvim, etc.)
export PATH="$HOME/.local/bin:$PATH"  # Expert LSP and other local tools
export PATH="$HOME/.asdf/shims:$PATH"  # ASDF version manager

# Prompt
eval "$(starship init zsh)"

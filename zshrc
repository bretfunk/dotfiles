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
alias 'cdu=cd ~/Documents/code/ucbi/ucbi_dev && ls -alp'
alias 'cds=cd ~/Documents/code/projects/service_amplify && ls -alp'
alias 'v=nvim'
alias 'lg=lazygit'

# Editor
export EDITOR='nvim'

# PATH setup (minimal)
export PATH="$HOME/.local/bin:$PATH"  # Expert LSP and other local tools
export PATH="$HOME/.asdf/shims:$PATH"  # ASDF version manager

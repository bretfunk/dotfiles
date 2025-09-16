# Navigation shortcuts
alias 'cdu=cd ~/Documents/code/ucbi/ucbi_dev && ls -alp'
alias 'cds=cd ~/Documents/code/projects/service_amplify && ls -alp'

# Editor
export EDITOR='nvim'
alias 'v=nvim'

# Dotfiles
alias 'dotfiles=cd ~/dotfiles && ls -alp'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'gitignore=nvim ~/dotfiles/gitignore'

#git
alias log='git log --pretty=format:"%h - %an, %ar : %s"'
alias lg='lazygit'

#ls with color
alias ls='ls -F -G'

#Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# homebrew on m1
export PATH=/opt/homebrew/bin:$PATH

#pynev
# when you had all of those nvim python issues you just needed to install pyenv
# and add the lines below and it fixed it
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Environment setup
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"

# Development tools
eval "$(direnv hook zsh)"
eval $(thefuck --alias)

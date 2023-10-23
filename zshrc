#navigation
alias 'cdc=cd ~/Documents/code && ls -alp'
alias 'cdn=cd ~/Documents/code/navitas && ls -alp'
alias 'cdnn=cd ~/Documents/code/navitas/navitex && ls -alp'
alias 'cdnb=cd ~/Documents/code/navitas/broker-portal-frontend && ls -alp'
alias 'cdnl=cd ~/Documents/code/navitas/lapis && ls -alp'
alias 'cdna=cd ~/Documents/code/navitas/ad-hoc && ls -alp'
alias 'cdnp=cd ~/Documents/code/navitas/prompt && ls -alp'
alias 'cdnv=cd ~/Documents/code/navitas/vendor-portal-api && ls -alp'
alias 'cdnf=cd ~/Documents/code/navitas/formation && ls -alp'
alias 'cdnq=cd ~/Documents/code/navitas/quoter-client && ls -alp'
alias 'cdf=cd ~/Documents/code/fun && ls -alp'
alias 'cdp=cd ~/Documents/code/projects && ls -alp'
alias 'cdt=cd ~/Documents/code/tutorials && ls -alp'
alias 'cdu=cd ~/Documents/code/ucbi/ucbi_dev && ls -alp'
alias 'cdq=cd ~/Documents/code/Q2 && ls -alp'
alias 'cdrp=cd ~/Documents/code/tutorials/rust/projects && ls -alp'
alias 'cdv=cd ~/Documents/code/va/visa_authority && ls -alp'
alias 'cdi=cd ~/Documents/code/projects/interview_authority && ls -alp'
alias 'cdpp=cd ~/Documents/code/projects/petal_pro-1.6.1/ && ls -alp'

#seasonal
alias 'cda=cd ~/Documents/code/advent_of_code/2021 && ls -alp'
alias 'gftg=cd ~/Documents/code/gftg && ls -alp'

#vim
#lunar vim
alias 'v=/Users/bretfunk/.local/bin/lvim'
alias 'lv=/Users/bretfunk/.local/bin/lvim'
export EDITOR='lvim'
# reset lunar vim config
alias 'lrc=cp ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua ~/.config/lvim/config.lua'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls -alp'
alias 'zshrc=lvim ~/dotfiles/zshrc'
alias 'gitignore=lvim ~/dotfiles/gitignore'

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

#adding for lvim
export PATH=$PATH:~/.local/bin

# asdf
# removing due to terminal error but probably need this
# . $(brew --prefix asdf)/asdf.sh
# eval $(brew --prefix asdf)/asdf.sh
export PATH=~/.asdf/shims:$PATH

export PATH="/opt/homebrew/sbin:$PATH"

# this scans projects for .envrc files and auto loads the variables
eval "$(direnv hook zsh)"

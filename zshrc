# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 # respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# kitty
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

#file navigation
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'

#navigation
alias 'cdc=cd ~/Documents/code && ls'
alias 'cdn=cd ~/Documents/code/navitas && ls'
alias 'cdnn=cd ~/Documents/code/navitas/navitex && ls'
alias 'cdnb=cd ~/Documents/code/navitas/broker-portal-frontend && ls'
alias 'cdnl=cd ~/Documents/code/navitas/lapis && ls'
alias 'cdna=cd ~/Documents/code/navitas/ad-hoc && ls'
alias 'cdnp=cd ~/Documents/code/navitas/oculus-client && ls'
alias 'cdnf=cd ~/Documents/code/navitas/formation && ls'
alias 'cdnq=cd ~/Documents/code/navitas/quoter-client && ls'
alias 'cdf=cd ~/Documents/code/fun && ls'
alias 'cdp=cd ~/Documents/code/projects && ls'
alias 'cdt=cd ~/Documents/code/tutorials && ls'

#yarn
alias 'ys=yarn start && git add dist && git add -p'
alias 'yul=yarn upgrade lapis && yarn start'

#vim
alias 'nv=nvim'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls'
alias 'scripts=cd ~/dotfiles && sh scripts.sh'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'vimrc=nvim ~/dotfiles/vimrc'
alias 'bashrc=nvim ~/dotfiles/bashrc'
alias 'gitignore=nvim ~/dotfiles/gitignore'
alias 'coc=nvim ~/dotfiles/coc-settings'
# alias 'init.vim=nvim ~/.config/nvim/init.vim'
# alias 'coc=nvim ~/.config/nvim/coc-settings.json'
alias 'kitty=nvim ~/dotfiles/kitty'
alias 'notes=cd ~/notes && ls'


#git
alias gl='git log --graph'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gb='git branch'
alias master='git checkout master'
alias last='git log -1 HEAD'
alias log='git log --pretty=format:"%h - %an, %ar : %s"'

# alias gf='git fetch --all --prune'
# alias gpr='git pull --rebase source master'
# git rebase source/<source-branch>
alias update='git fetch --all --prune && git rebase source/master'
# alias squash='git rebase -i HEAD~5'
# alias amend='git commit --amend --no-edit'

alias clean='git clean -f'
alias reset='git reset --hard'

alias yb='yarn build && git add dist && git add -p'
alias ga='git add dist && git add -p'
# alias gca='git commit --amend --no-edit'
alias gpf='git push --force'

#tmate
alias tsession='tmate display -p '#{tmate_ssh}''

#ls with color
alias ls='ls -F -G'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#thefuck CLI helper
eval $(thefuck --alias fuck)

# node
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/python3/bin:$PATH"

# elixir
# export PATH="$PATH:/path/to/elixir/bin"
#make zshrc use vi keybindings
# bindkey -v


#Path to your oh-my-zsh installation.
export ZSH="/Users/bretfunk/.oh-my-zsh"

 # ZSH_THEME="robbyrussell"
 # ZSH_THEME="avit"
 # ZSH_THEME="miloshadzic"
 ZSH_THEME="muse"

plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# User configuration
# no idea what this does but it was in the instructions so keeping it in here
 export MANPATH="/usr/local/man:$MANPATH"
 export PATH="/usr/local/opt/node@8/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Node Version Manager
source ~/.nvm/nvm.sh


# added by travis gem
[ -f /Users/bretfunk/.travis/travis.sh ] && source /Users/bretfunk/.travis/travis.sh

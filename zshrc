# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#navigation
alias 'cdc=cd ~/../../Volumes/code && ls'
alias 'cdn=cd ~/../../Volumes/code/navitas && ls'
alias 'cdb=cd ~/../../Volumes/code/navitas/broker-portal-frontend && ls'
alias 'cdl=cd ~/../../Volumes/code/navitas/lapis && ls'
alias 'cda=cd ~/../../Volumes/code/navitas/ad-hoc && ls'
alias 'cdf=cd ~/../../Volumes/code/fun && ls'
alias 'cdp=cd ~/../../Volumes/code/projects && ls'
alias 'cdt=cd ~/../../Volumes/code/tutorials && ls'
alias 'vimrc=nvim ~/dotfiles/vimrc'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'init.vim=nvim ~/.config/nvim/init.vim'

#yarn
alias 'ys=yarn start && git add dist && git add -p'
alias 'yul=yarn upgrade lapis && yarn start'

#vim
#need to ween myself off of typing vim and using nv instead
alias 'nv=nvim .'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls'
alias 'scripts=cd ~/dotfiles && sh scripts.sh'

#git
alias gl='git log --graph'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gb='git branch'
alias master='git checkout master'
alias last='git log -1 HEAD'

# alias gf='git fetch --all --prune'
# alias gpr='git pull --rebase source master'
# git rebase source/<source-branch>
alias update='git fetch --all --prune && git rebase source/master'
# alias squash='git rebase -i HEAD~5'
alias amend='git commit --amend --no-edit'

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

#bash autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#thefuck CLI helper
eval $(thefuck --alias fuck)

# node
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/python3/bin:$PATH"
eval "$(rbenv init -)"
# elixir
# export PATH="$PATH:/path/to/elixir/bin"

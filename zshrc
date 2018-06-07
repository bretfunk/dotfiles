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
alias 'cdf=cd ~/../../Volumes/code/fun && ls'
alias 'cdp=cd ~/../../Volumes/code/projects && ls'
alias 'cdt=cd ~/../../Volumes/code/tutorials && ls'
alias 'cdm=cd ~/../../Volumes/code/musicoin && ls'
alias 'vimrc=nvim ~/dotfiles/vimrc'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'init.vim=nvim ~/.config/nvim/init.vim'

#yarn
alias 'ys=yarn start'
alias 'yul=yarn upgrade lapis && yarn start'

#vim
#need to ween myself off of typing vim and using nv instead
alias 'vim=$'
alias 'nv=nvim .'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls'
alias 'scripts=cd ~/dotfiles && sh scripts.sh'

#git
alias gl='git log --graph'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
# alias gc='git checkout'
#alias gra='git remote add'
#alias grr='git remote rm'
#alias gpu='git pull'
alias gf='git fetch --all --prune'
alias gpr='git pull --rebase source master'
alias update='git fetch --all --prune && git pull --rebase source master'

alias yb='yarn build'
alias ga='git add dist && git add -p'
alias gca='git commit --amend --no-edit'
alias gpf='git push --force'

#alias gcl='git clone'
#alias gta='git tag -a -m'
#alias gf='git reflog'

#ls with color
alias ls='ls -F -G'

#bash autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#thefuck CLI helper
eval $(thefuck --alias fuck)

export PATH="/usr/local/opt/node@8/bin:$PATH"

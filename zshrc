# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 # respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
alias 'yul=yarn upgrade lapis && yarn start'

#vim
alias 'v=nvim'

#scripts
alias 'scripts=cd ~/dotfiles && sh scripts.sh'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'vimrc=nvim ~/dotfiles/vimrc'
alias 'bashrc=nvim ~/dotfiles/bashrc'
alias 'gitignore=nvim ~/dotfiles/gitignore'
alias 'coc=nvim ~/dotfiles/coc-settings'
alias 'notes=cd ~/notes && ls'

#git
alias log='git log --pretty=format:"%h - %an, %ar : %s"'
alias yb='yarn build && git add dist && git add -p'

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

#Path to your oh-my-zsh installation.
export ZSH="/Users/bretfunk/.oh-my-zsh"

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

#navigation
alias 'cdc=cd ~/Documents/code && ls'
alias 'cdn=cd ~/Documents/code/navitas && ls'
alias 'cdnn=cd ~/Documents/code/navitas/navitex && ls'
alias 'cdnb=cd ~/Documents/code/navitas/broker-portal-frontend && ls'
alias 'cdnl=cd ~/Documents/code/navitas/lapis && ls'
alias 'cdna=cd ~/Documents/code/navitas/ad-hoc && ls'
alias 'cdnp=cd ~/Documents/code/navitas/prompt && ls'
alias 'cdnv=cd ~/Documents/code/navitas/vendor-portal-api && ls'
alias 'cdnf=cd ~/Documents/code/navitas/formation && ls'
alias 'cdnq=cd ~/Documents/code/navitas/quoter-client && ls'
alias 'cdf=cd ~/Documents/code/fun && ls'
alias 'cdp=cd ~/Documents/code/projects && ls'
alias 'cdt=cd ~/Documents/code/tutorials && ls'
alias 'cdu=cd ~/Documents/code/ucbi && ls'
alias 'cdud=cd ~/Documents/code/ucbi/ucbi_dev && ls'
alias 'cdq=cd ~/Documents/code/Q2 && ls'

#yarn
alias 'yul=yarn upgrade lapis && yarn start'

#vim
alias 'v=nvim'

#scripts
alias 'ud=cd ~/dotfiles && sh scripts.sh'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls'
alias 'zshrc=nvim ~/dotfiles/zshrc'
alias 'vimrc=nvim ~/dotfiles/vimrc'
alias 'bashrc=nvim ~/dotfiles/bashrc'
alias 'gitignore=nvim ~/dotfiles/gitignore'
alias 'coc=nvim ~/dotfiles/coc-settings'
alias 'notes=cd ~/notes && ls'
alias 'articles=cd ~/articles && ls'

#git shaming
gs() {
  echo "USE GIT FUGITIVE YOU FOOL!"
}

#git
alias log='git log --pretty=format:"%h - %an, %ar : %s"'
alias yb='yarn build && git add dist && git add -p'

#ghetto dash
alias 'docs=echo "hex\necto\nex\nphx\nlive\ntailwind\nsurface\n"'
alias 'hex=open -a "Google Chrome" https://hexdocs.pm/'
alias 'ecto=open -a "Google Chrome" https://hexdocs.pm/ecto'
alias 'ex=open -a "Google Chrome" https://hexdocs.pm/elixir'
alias 'phx=open -a "Google Chrome" https://hexdocs.pm/phoenix'
alias 'live=open -a "Google Chrome" https://hexdocs.pm/phoenix_live_view'
alias 'tailwind=open -a "Google Chrome" https://tailwindui.com/components'
alias 'surface=open -a "Google Chrome" http://surface-demo.msaraiva.io/getting_started'

#github page open from terminal
gh() { git brws --repo "NavitasLease/$1"}

#ls with color
alias ls='ls -F -G'

#path
alias path='$PATH --pretty'

#thefuck CLI helper
eval $(thefuck --alias fuck)

#secret
source ~/dotfiles/secret

#python
alias python='/usr/local/bin/python3'

#Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

#node version manager
source ~/.nvm/nvm.sh

# what does this do?!
# added by travis gem
[ -f /Users/bretfunk/.travis/travis.sh ] && source /Users/bretfunk/.travis/travis.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:~/Desktop/nand2tetris/tools

#starship for the terminal
eval "$(starship init zsh)"

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
alias 'cdrp=cd ~/Documents/code/tutorials/rust/projects && ls'

#seasonal
alias 'cda=cd ~/Documents/code/advent_of_code/2021 && ls'

#yarn
alias 'yul=yarn upgrade lapis && yarn start'
#this is for the mac m1 to not get not supported version of node-sass errors
# alias 'yarn= yarn —target_arch=x64'

#vim
alias 'v=nvim'
# alias 'v=vim'

#scripts
alias 'ud=cd ~/dotfiles && sh scripts.sh'

#dotfiles
alias 'dotfiles=cd ~/dotfiles && ls -al'
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
# gh() { git brws --repo "NavitasLease/$1"}

#ls with color
alias ls='ls -F -G'

#path
# alias path='$PATH --pretty'

#secret
source ~/dotfiles/secret

#python
# m1 has diff homebrew path
#export PYTHONPATH="${PYTHONPATH}:/my/other/path"
# alias python='/usr/local/bin/python3'
# alias python='/opt/homebrew/bin/python3'
# alias python3='/opt/homebrew/bin/python3'

# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile

#Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# added by travis gem
# [ -f /Users/bretfunk/.travis/travis.sh ] && source /Users/bretfunk/.travis/travis.sh
#
export PATH="/Users/bretfunk/solana"/bin:"$PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:$PATH"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:$PATH:$PATH:/Users/bretfunk/Documents/code/tutorials/solana/solana"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/bretfunk/.local/share/solana/install/active_release/bin:$PATH:/opt/homebrew/opt/openssl@1.1/bin:$PATH:/Users/bretfunk/Documents/code/tutorials/solana/solana"/bin:"$PATH"
# add to path line by line
# path+="$HOME/.emacs.d/bin"

#nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#rust programming language
source $HOME/.cargo/env

#node version manager
# source ~/.nvm/nvm.sh
# npm config delete prefix

#******homebrew installs below*****
eval $(/opt/homebrew/bin/brew shellenv)

#starship for the terminal
eval "$(starship init zsh)"

#python
eval "$(pyenv init --path)"

#homebew 
export PATH="/opt/homebrew/bin:$PATH"

#the fuck
eval $(thefuck --alias fuck)
[ -f "/Users/bretfunk/.ghcup/env" ] && source "/Users/bretfunk/.ghcup/env" # ghcup-env

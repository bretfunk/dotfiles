[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#bash autocompletion
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
 fi

 #kitty
 source <(kitty + complete setup bash)

# added by travis gem
[ -f /Users/bretfunk/.travis/travis.sh ] && source /Users/bretfunk/.travis/travis.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bureau"

plugins=(
  vi-mode
  autojump
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

HISTSIZE=1000000
SAVEHIST=1000000

# fzf
export FZF_DEFAULT_OPTS="--extended --cycle --reverse --ansi"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load custom scripts
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done

# ensure correct profile
source $HOME/.bash_profile

if type nvim > /dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi


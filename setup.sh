#!/bin/sh

cd `dirname $0`

find `pwd` -maxdepth 1 -mindepth 1 -name '.*' | \
  grep -v ".git$" | \
  grep -v ".gitmodules" | \
  xargs -I{} ln -fs {} $HOME

git submodule init && git submodule update
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

vim +PlugInstall +qall

echo "You may want to ..."
echo "cp `pwd`/zshenv.example ~/.zshenv && vim ~/.zshenv"

#!/bin/sh

cd `dirname $0`

find `pwd` -maxdepth 1 -mindepth 1 -name '.*' | \
  grep -v ".git$" | \
  grep -v ".gitmodules" | \
  xargs -I{} ln -fs {} $HOME

git submodule init && git submodule update

vim +PlugInstall +qall

echo "You may want to ..."
echo "cp `pwd`/zshenv.example ~/.zshenv && vim ~/.zshenv"

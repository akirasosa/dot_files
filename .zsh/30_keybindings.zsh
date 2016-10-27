autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey -r '^T' # unbind fzf-file-widget for tmux binding
bindkey '^F' fzf-file-widget

# fzf ghq list
fzf-ghq-list-widget() {
  local selected_dir=$(ghq list --full-path | fzf -q "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-ghq-list-widget
bindkey '^]' fzf-ghq-list-widget

# fzf autojump
fzf-autojump-widget() {
  local selected_dir=$(autojump -s | tac | sed -e '1,7d' | awk '{print $2}' | fzf +s -q "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-autojump-widget
bindkey '^J' fzf-autojump-widget

# fzf history
fzf-history-widget() {
    BUFFER=$(\history -n 1 |  fzf --tac -q "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

fzf-git-checkout() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l60 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}
zle -N fzf-git-checkout
bindkey '^Gc' fzf-git-checkout

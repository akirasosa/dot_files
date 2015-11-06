bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# fzf ghq list
fzf-ghq-list-widget() {
  local selected_dir=$(ghq list --full-path | fzf --query "$LBUFFER")
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
  local selected_dir=$(autojump -s | tail -r | sed -e '1,7d' | awk '{print $2}' | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-autojump-widget
bindkey '^J' fzf-autojump-widget

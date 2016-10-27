# cd 後に自動で ls
cd() { builtin cd $@ && ls;}

# encode
urlencode() {
  echo $* | nkf -eMQ | tr = %
}
urldecode() {
  echo $* | tr % = | nkf -emQ
}

# android
androidScreenshot() {
  adb shell exit 2>/dev/null
  if [[ $? == 0 ]]; then
    dateString=`date +"%Y-%m-%d_%H.%M.%S"`
    fileName="ss_$dateString.png"
    adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > ~/Desktop/$fileName
  else
    echo "No android device connected."
  fi
}

fcd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "${dir}"
}

fcdf() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "${file}") && cd "${dir}"
}

fo() {
  local file
  file=$(fzf +m -q "$1") && open "${file}"
}

fe() {
  local file
  file=$(fzf +m -q "$1") && ${EDITOR:-vim} "${file}"
}

fmcd() {
  local dir
  dir=$(mdfind "kind:folder" -name "$1" 2> /dev/null | fzf) && cd "${dir}"
}

fmcdf() {
  local file
  local dir
  file=$(mdfind -name "$1" 2> /dev/null | fzf) && dir=$(dirname "${file}") && cd "${dir}"
}

fmo() {
  local file
  file=$(mdfind -name "$1" 2> /dev/null | fzf) && open "${file}"
}

fme() {
  local file
  file=$(mdfind -name "${1}" 2> /dev/null | fzf) && ${EDITOR:-vim} "${file}"
}

# git commit browser
fglog() {
  local out shas sha q k
  while out=$(
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --multi --no-sort --reverse --query="$q" \
      --print-query --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

# ftpane - switch pane
ftpane () {
  local panes current_window target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_window=$(tmux display-message  -p '#I')

  target=$(echo "$panes" | fzf) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

# c - browse chrome history
fchist() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}


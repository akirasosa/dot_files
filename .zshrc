# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="avit"
#ZSH_THEME="3den"
#ZSH_THEME="adben"
#ZSH_THEME="af-magic"
#ZSH_THEME="afowler"
#ZSH_THEME="agnoster"
#ZSH_THEME="alanpeabody"
#ZSH_THEME="apple"
#ZSH_THEME="arrow"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="bira"
#ZSH_THEME="blinks"
#ZSH_THEME="candy-kingdom"
#ZSH_THEME="candy"
#ZSH_THEME="clean"
#ZSH_THEME="cloud"
#ZSH_THEME="crunch"
#ZSH_THEME="cypher"
#ZSH_THEME="dallas"
#ZSH_THEME="darkblood"
#ZSH_THEME="daveverwer"
#ZSH_THEME="dieter"
#ZSH_THEME="dogenpunk"
#ZSH_THEME="dpoggi"
#ZSH_THEME="dst"
#ZSH_THEME="dstufft"
#ZSH_THEME="duellj"
#ZSH_THEME="eastwood"
#ZSH_THEME="edvardm"
#ZSH_THEME="evan"
#ZSH_THEME="example"
#ZSH_THEME="fino-time"
#ZSH_THEME="fino"
#ZSH_THEME="fishy"
#ZSH_THEME="flazz"
#ZSH_THEME="fletcherm"
#ZSH_THEME="fox"
ZSH_THEME="frisk"
#ZSH_THEME="frontcube"
#ZSH_THEME="funky"
#ZSH_THEME="fwalch"
#ZSH_THEME="gallifrey"
#ZSH_THEME="gallois"
#ZSH_THEME="garyblessington"
#ZSH_THEME="gentoo"
#ZSH_THEME="geoffgarside"
#ZSH_THEME="gnzh"
#ZSH_THEME="gozilla"
#ZSH_THEME="humza"
#ZSH_THEME="imajes"
#ZSH_THEME="intheloop"
#ZSH_THEME="jbergantine"
#ZSH_THEME="jispwoso"
#ZSH_THEME="jnrowe"
#ZSH_THEME="jonathan"
#ZSH_THEME="josh"
#ZSH_THEME="jreese"
#ZSH_THEME="jtriley"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="junkfood"
#ZSH_THEME="kafeitu"
#ZSH_THEME="kardan"
#ZSH_THEME="kennethreitz"
#ZSH_THEME="kolo"
#ZSH_THEME="kphoen"
#ZSH_THEME="lambda"
#ZSH_THEME="linuxonly"
#ZSH_THEME="lukerandall"
#ZSH_THEME="macovsky-ruby"
#ZSH_THEME="macovsky"
#ZSH_THEME="maran"
#ZSH_THEME="mgutz"
#ZSH_THEME="mh"
#ZSH_THEME="michelebologna"
#ZSH_THEME="mikeh"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="minimal"
#ZSH_THEME="mortalscumbag"
#ZSH_THEME="mrtazz"
#ZSH_THEME="murilasso"
#ZSH_THEME="muse"
#ZSH_THEME="nanotech"
#ZSH_THEME="nebirhos"
#ZSH_THEME="nicoulaj"
#ZSH_THEME="norm"
#ZSH_THEME="obraun"
#ZSH_THEME="philips"
#ZSH_THEME="pmcgee"
#ZSH_THEME="pygmalion"
#ZSH_THEME="re5et"
#ZSH_THEME="rgm"
#ZSH_THEME="risto"
#ZSH_THEME="rixius"
#ZSH_THEME="rkj-repos"
#ZSH_THEME="rkj"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="sammy"
#ZSH_THEME="simonoff"
#ZSH_THEME="simple"
#ZSH_THEME="skaro"
#ZSH_THEME="smt"
#ZSH_THEME="Soliah"
#ZSH_THEME="sorin"
#ZSH_THEME="sporty_256"
#ZSH_THEME="steeef"
#ZSH_THEME="sunaku"
#ZSH_THEME="sunrise"
#ZSH_THEME="superjarin"
#ZSH_THEME="suvash"
#ZSH_THEME="takashiyoshida"
#ZSH_THEME="terminalparty"
#ZSH_THEME="theunraveler"
#ZSH_THEME="tjkirch"
#ZSH_THEME="tjkirch_mod"
#ZSH_THEME="tonotdo"
#ZSH_THEME="trapd00r"
#ZSH_THEME="wedisagree"
#ZSH_THEME="wezm+"
#ZSH_THEME="wezm"
#ZSH_THEME="wuffers"
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="xiong-chiamiov"
#ZSH_THEME="zhann"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode bundler gem heroku osx rails ruby rvm autojump vundle redis-cli vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

HISTSIZE=1000000
SAVEHIST=1000000

setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt share_history         # 履歴の共有
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除(先頭にスペースを入れておけば、ヒストリに保存されない)
unsetopt hist_verify         # ヒストリを呼び出してから実行する間に一旦編集可能を止める
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_save_no_dups     # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する。
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_expand           # 補完時にヒストリを自動的に展開
setopt nocorrectall

# history completion
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias mv="mv -i"
alias tmux="tmux -u"
alias sourcetree='open -a SourceTree'

# cd 後に自動で ls
function cd() { builtin cd $@ && ls;}

function urlencode () {
  echo $* | nkf -eMQ | tr = %
}
function urldecode () {
  echo $* | tr % = | nkf -emQ
}

# added by travis gem
[ -f /Users/akira/.travis/travis.sh ] && source /Users/akira/.travis/travis.sh

# peco
for f (~/.zsh/peco-scripts/*) source "${f}"
bindkey '^r' peco-select-history
bindkey '^]' peco-src

# android
for f (~/.zsh/android-scripts/*) source "${f}"

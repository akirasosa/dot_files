export PATH=${PATH}:${HOME}/bin

# for android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}

# for java
#export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=${PATH}:${JAVA_HOME}/bin

# for groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# for cocoapods
export LC_ALL="en_US.UTF-8"

# for go
export GOPATH=$HOME

# for nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux


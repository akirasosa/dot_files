export PATH=${PATH}:${HOME}/bin

# for android
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_SDK_ROOT}/tools:${ANDROID_SDK_ROOT}/platform-tools

# for Android Studio
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/1.6.0.jdk

# for java
#export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=${PATH}:${JAVA_HOME}/bin

# for groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# for flutter
export PATH=/Users/akira/src/github.com/flutter/flutter/bin:${PATH}

# for cocoapods
export LC_ALL="en_US.UTF-8"

# for go
export GOPATH=$HOME

# for nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for homebrew
export PATH=/usr/local/bin:${PATH}

# for pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# for rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by travis gem
[ -f /Users/akira/.travis/travis.sh ] && source /Users/akira/.travis/travis.sh

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux


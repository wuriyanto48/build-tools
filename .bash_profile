# cat ~/.bash_profile
# my OSX's .bash_profile for development
export GOPATH=/Users/wuriyanto/Documents/go-work
export PATH="/Users/wuriyanto/Documents/go-work/bin:$PATH"

export M2_HOME=/Users/wuriyanto/Documents/apache-maven-3.6.1
export PATH=$PATH:$M2_HOME/bin

export PATH=/usr/local/php5/bin:$PATH

export OC_ORIGIN_HOME=/Users/wuriyanto/Downloads/openshift-origin-client-tools-v3.11.0-0cbc58b-mac
export PATH=$PATH:$OC_ORIGIN_HOME

export PROTOC_HOME=/Users/wuriyanto/Documents/protoc-3.9.2-osx-x86_64
export PATH=$PATH:$PROTOC_HOME/bin

export LUA_HOME=/Users/wuriyanto/Documents/random/lua-5.3.5
export PATH=$PATH:$LUA_HOME/src


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home)

export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
alias python='python3'

eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source "$HOME/.cargo/env"

source ~/.dotfiles/zsh/zshrc-manager.sh

export XDG_CONFIG_HOME=~/.config

# User specific aliases and functions
export WORKSPACE=~/Workspace
export IDEA_JDK=/usr/java/latest
export JAVA_HOME=/usr/java/latest
export JDK_HOME=/usr/java/latest

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export ANDROID_HOME=/usr/local/lib/android/android-sdk-linux

export JAVA_HOME=/usr/java/default                                                                        

function setpath() {
	unset PATH
	PATH=$PATH:$JAVA_HOME/bin
	PATH=$PATH:$HOME/bin
	PATH=$PATH:/usr/bin
	PATH=$PATH:/usr/local/bin
	PATH=$PATH:/bin
	PATH=$PATH:/usr/X11R6/bin
	PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
	export PATH
}

function setcdpath() {
	unset CDPATH
	CDPATH=$CDPATH:${WORKSPACE}/dev
	export CDPATH
}

setpath
setcdpath

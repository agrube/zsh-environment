#default prompt
export CVSROOT=:ext:afgrube@cvs.solipsys.com:/cvs
export CVS_RSH=/usr/bin/ssh

# enable colors
CLICOLOR=1 # Enables color in the terminal bash shell export
LSCOLORS=gxfxcxdxbxegedabagacad # Sets up the color scheme for list export
export LSCOLORS
alias ls='ls --color'

export WORKSPACE=~/Workspace
export DEV=$WORKSPACE/dev

export LICENSE_DIR=$WORKSPACE/licenses

export GRADLE_OPTS="-Dhttp.proxyHost=ml-proxy.solipsys.com -Dhttp.proxyPort=8080 -Dhttps.proxyHost=ml-proxy.solipsys.com -Dhttps.proxyPort=8080"

# general
alias vim='vi'
alias rm='rm -i';
alias classpath='echo $CLASSPATH | tr ":" "\n"'
alias jgrep='find ./ -iname "*.java" | xargs grep -F'
alias liquibaseu='liquibase --driverPropertiesFile=C:/cygwin/usr/local/lib/liquibase/liquibase.properties'
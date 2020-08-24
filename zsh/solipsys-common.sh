#default prompt
export CVSROOT=:ext:afgrube@cvs.solipsys.com:/cvs
export CVS_RSH=/usr/bin/ssh

# enable colors
CLICOLOR=1 # Enables color in the terminal bash shell export
LSCOLORS=gxfxcxdxbxegedabagacad # Sets up the color scheme for list export
export LSCOLORS
alias ls='ls'

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
alias subl='subl.exe'

function intellij-fix()
{
  echo "Replacing /mnt/c with C:"
  find . -name ".classpath" -print0 | xargs -0 sed -i '' -e 's/\/mnt\/c/C\:/g'
}

function loadPathFile()
{
  PATH=/usr/bin:/bin
  local os_ver="$(uname -a)"
  local is_linux=$(echo ${os_ver:0:1})
  if [[ "$is_linux" == "L" ]];
  then 
    source ~/.dotfiles/zsh/solipsys-linux-path.sh
    echo "Using Linux Solipsys Configuration!"
  else
    source ~/.dotfiles/zsh/solipsys-path.sh
    echo "Using Cygwin Solipsys Configuration!"
  fi
}

cleanReleaseDirs() {
  find . -name release -type d | xargs rm -rf
  find . -wholename *build/jar -type d | xargs rm -rf
  find . -wholename *build/protoclasses -type d | xargs rm -rf
} 

fixClassPaths() {
  find . -name .classpath -exec sed -i 's/\/mnt\/c/C:/g' {} \;
} 

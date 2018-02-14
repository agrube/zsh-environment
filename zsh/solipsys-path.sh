export JAVA=$WORKSPACE/lib/java

export ASSAULT_HOME=$WORKSPACE/lib/assault/release
export PROTO_HOME=$WORKSPACE/lib/protoc
export SUBLIME_HOME=/cygdrive/c/Program\ Files/Sublime\ Text\ 3/
export GRADLE_HOME=$WORKSPACE/lib/gradle/gradle-4.0
export VAGRANT_HOME=/cygdrive/c/HashiCorp/Vagrant
export CHOCO_HOME=/cygdrive/c/ProgramData/chocolatey
export PS_HOME=/cygdrive/c/Windows/System32/WindowsPowerShell/v1.0/
export NODE_HOME=/cygdrive/c/Program\ Files/nodejs
export NPM_HOME=~/AppData/Roaming/npm/node_modules

function setpath() {
  unset PATH
  PATH=$PATH:${JAVA_HOME}/bin
  PATH=$PATH:${HOME}/bin
  PATH=$PATH:/usr/bin
  PATH=$PATH:/usr/local/bin
  PATH=$PATH:/bin
  PATH=$PATH:/usr/X11R6/bin
  PATH=$PATH:${ASSAULT_HOME}/ant/bin
  PATH=$PATH:${ASSAULT_HOME}/bin
  PATH=$PATH:${ASSAULT_HOME}
  PATH=$PATH:${SUBLIME_HOME}
  PATH=$PATH:${PROTO_HOME}/bin
  PATH=$PATH:${GRADLE_HOME}/bin
  PATH=$PATH:${VAGRANT_HOME}/bin
  PATH=$PATH:${CHOCO_HOME}/bin
  PATH=$PATH:${PS_HOME}
  PATH=$PATH:${NODE_HOME}
  PATH=$PATH:${NPM_HOME}/@angular/cli/bin
  export PATH
}

function setcdpath() {
  unset CDPATH
  CDPATH=$CDPATH:${WORKSPACE}/dev
  CDPATH=$CDPATH:${WORKSPACE}
  export CDPATH
}

function setjava() {
  local version=$1
  local supportedVersions=(6 7 8)
  local success=0
  for i in "${supportedVersions[@]}"
  do
    if [ "$i" -eq "$version" ]
    then
      success=1
    fi
  done
  if [ "$success" -eq "1" ]
  then
    export JAVA_HOME=$JAVA/$version
    export ANT_OPTS="-Xmx128m -DJAVA_HOME=$(cygpath -m ${JAVA_HOME}) -DASSAULT_HOME=$(cygpath -m ${ASSAULT_HOME}) -Djava.endorsed.dirs=$(cygpath -m ${ASSAULT_HOME})/lib/xalan-2.7 -DLicense.dir=$(cygpath -m ${LICENSE_DIR})"
    export ANT_ARGS="-s build.xml"
    setpath
    java -version
  else
    echo "Java $version not installed."
  fi
}

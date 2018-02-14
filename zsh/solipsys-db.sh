export DB_HOME=$DEV/core/5.x
export TDFDB_HOME=$DB_HOME/metamorph/tdfdb/common
export TDFDB_P_HOME=$DB_HOME/metamorph/tdfdb/postgres-impl
export MSCTDB_HOME=$DB_HOME/mud/msctdb/common
export DB_RELEASE_HOME=$DB_HOME/athena-display/athenadb/postgres-impl
export ATHENA_HOME=$DB_HOME/athena-display/athena
export LLOYDS_HOME=$DB_HOME/athena-extensions/lloyds

function cleandb()
{
  echo "Cleaning ${DB_RELEASE_HOME}/release..." 
  rm -rf $DB_RELEASE_HOME/release/data/users 
  rm -rf $DB_RELEASE_HOME/release/data/compiled 
  rm -rf $DB_RELEASE_HOME/release/data/caches 
  echo "Clean completed!"
}

function builddb() {
  local version=$1
  local start=`date +%s`
  if [ "$version" = "tdf" ]
  then
    echo "TDFDB Build"
    cd $TDFDB_HOME 
    ant local 
    ant war
    cleandb
    cpdb tdf
  elif [ "$version" = "tdfp" ]
  then
    echo "TDFDB Postgres Build"
    cd $TDFDB_P_HOME 
    ant local 
    cleandb
    cpdb tdfp
  elif [ "$version" = "msct" ]
  then
    echo "MSCTDB Build"
    cd $MSCTDB_HOME 
    ant local 
    cleandb
    cpdb msct
  elif [ "$version" = "lloyds" ]
  then
    echo "Lloyds Build"
    cd $LLOYDS_HOME 
    ant notest local 
    cleandb
    cpdb lloyds
  else
    echo "Please enter lloyds, msct, tdfp or tdf"
  fi
  local end=`date +%s`
  local runtime=$((end-start))
  echo "Total time: $runtime seconds" 
}

function cpdb() {
  local version=$1
  local target=$TDFDB_HOME
  local release=${DB_RELEASE_HOME}
  if [ "$version" = "tdf" ]
  then
    target=$TDFDB_HOME
  elif [ "$version" = "tdfp" ]
  then
    target=$TDFDB_P_HOME
  elif [ "$version" = "msct" ]
  then
    target=$MSCTDB_HOME
  elif [ "$version" = "lloyds" ]
  then
    target=$LLOYDS_HOME
  fi
  echo "Copying files from ${target} to ${release}..." 
  cp -r $target/release $release
  echo "Copy has completed!"
}

function cpwar() {
  local version=$1
  if [ "$version" = "tdf" ]
  then
    echo "Copying ${TDFDB_HOME}/war/dashboard to ${DB_RELEASE_HOME}/release/tmp/webapp"
    cp -r $TDFDB_HOME/war/dashboard $DB_RELEASE_HOME/release/tmp/webapp
  elif
  then
    echo "Copying ${LLOYDS_HOME}/war/dashboard to ${DB_RELEASE_HOME}/release/tmp/webapp"
    cp -r $LLOYDS_HOME/war/dashboard $DB_RELEASE_HOME/release/tmp/webapp
  else
    echo "Please enter lloyds or tdf"
  fi
  echo "Copy has completed."
}
export DB_HOME=$DEV/core/5.8
export TDFDB_HOME=$DB_HOME/metamorph/tdfdb
export MSCTDB_HOME=$DB_HOME/mud/msctdb
export RIAK_HOME=$DB_HOME/database/tdf-extensions/riak
export LLOYDS_HOME=$DB_HOME/athena-extensions/lloyds

function cleandb()
{
  echo "Cleaning ${RIAK_HOME}/release..." 
  rm -rf $RIAK_HOME/release/data/users 
  rm -rf $RIAK_HOME/release/data/compiled 
  rm -rf $RIAK_HOME/release/data/caches 
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
  elif [ "$version" = "msct" ]
  then
    echo "MSCTDB Build"
    cd $MSCTDB_HOME 
    ant local 
    cleandb
    cpdb msct
  elif [ "$version" = "riak" ]
  then
    echo "Riak Build"
    cd $RIAK_HOME 
    ant local
    cleandb
  elif [ "$version" = "lloyds" ]
  then
    echo "Lloyds Build"
    cd $LLOYDS_HOME 
    ant local 
    cleandb
    cpdb lloyds
  else
    echo "Please enter lloyds, msct or tdf"
  fi
  local end=`date +%s`
  local runtime=$((end-start))
  echo "Total time: $runtime seconds" 
}

function cpdb() {
  local version=$1
  local target=$TDFDB_HOME
  if [ "$version" = "tdf" ]
  then
    target=$TDFDB_HOME
  elif [ "$version" = "msct" ]
  then
    target=$MSCTDB_HOME
  elif [ "$version" = "lloyds" ]
  then
    target=$LLOYDS_HOME
  fi
  echo "Copying files from ${target} to ${RIAK_HOME}..." 
  cp -r $target/release $RIAK_HOME
  echo "Copy has completed!"
}

function cpwar() {
  cp -r $TDFDB_HOME/war/dashboard $RIAK_HOME/release/tmp/webapp
}
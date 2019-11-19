#!/bin/sh

export P4PORT=192.168.1.1:1666
export P4USER=user1
export P4CLIENT=CLIENT_FOR_MIGRATION_FROM_GIT

P4_PATH=~/my_p4_repo
SCRIPT_PATH=$(pwd)

cd $P4_PATH
p4 status > /dev/null
if [ $? -ne 0 ]
then
  echo "Can't continue!"
  return
fi

git filter-branch --index-filter '$SCRIPT_PATH/migrate_step.sh $GIT_COMMIT "$GIT_AUTHOR_NAME"'
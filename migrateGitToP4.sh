#!/bin/sh

export P4PORT=192.168.1.1:1666
export P4USER=user1
export P4PASSWD=123456
export P4CLIENT=CLIENT_FOR_MIGRATION_FROM_GIT

export P4_PATH=~/my_p4_repo
export GIT_PATH=~/my_git_repo
export SCRIPT_PATH=$(pwd)
echo $GIT_PATH

cd $P4_PATH
p4 status > /dev/null
if [ $? -ne 0 ]
then
  echo "Can't continue!"
  return
fi

cd $GIT_PATH
git filter-branch --index-filter '$SCRIPT_PATH/migrate_step.sh $GIT_COMMIT "$GIT_COMMITTER_NAME", "$GIT_COMMITTER_DATE"'
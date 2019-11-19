#!/bin/sh

GIT_PATH=~/my_git_repo

git --git-dir=$GIT_PATH/.git reset --hard $1
GIT_MSG=$(git log --format=%B -n 1 HEAD)
GIT_AUTHOR=$2

p4 reconcile //depot/...
p4 submit -d "$GIT_AUTHOR: $GIT_MSG"

#!/bin/bash

REPO_PATH="${HOME}/Projects/openstack"

ORIGIN="origin"
REMOTES="upstream eayunstack"
UPSTREAM_BRANCH="master juno kilo"
EAYUNSTACK_BRANCH="eayunstack-1.0 eayunstack-1.1"
REPOS="nova neutron cinder oslo.messaging"


function usage () {
  echo "./sync_code.sh to sync local repo with github;"
  echo "./sync_code.sh -p to sync local repo and push to origin remote repo;"
}

function parse_opt () {
  while getopts "p" opt
  do
      case $opt in
          p) push='y';;
          h) usage;exit 0;;
      esac
  done
}

function fetch_objects () {
  repo=${1}
  OLDPATH=${PWD}

  cd ${REPO_PATH}/${repo}

  for remote in ${REMOTES}
  do
    git fetch ${remote}
  done

  cd ${OLDPATH}
}

function generate_tags () {
# Must be run in a repo
  branch=$1
  echo "=======Generating Tags======="
  ctags -R -f .tags --sort=yes --fields=+iaSl --extra=+q --languages=Python . && pycscope -R -f .cscope .
  cp .tags .${branch}_tags
  cp .cscope .${branch}_cscope
}

function sync_from_upstream () {
  repo=${1}
  OLDPATH=${PWD}

  cd ${REPO_PATH}/${repo}

  for branch in $UPSTREAM_BRANCH
  do
    git checkout ${branch}
    if [ ${branch} == "master" ]
    then
      upstream_branch="upstream/${branch}"
    else
      upstream_branch="upstream/stable/${branch}"
    fi
    git merge ${upstream_branch}
    if [ "i${push}" == "iy" ]
    then
      git push origin ${branch}
    fi
    #TODO unable to push to eayunstack, because of authentication
    generate_tags
  done

  cd ${OLDPATH}
}

function sync_from_eayunstack () {
  repo=$1
  OLDPATH=${PWD}

  cd ${REPO_PATH}/${repo}

  for branch in $EAYUNSTACK_BRANCH
  do
    git checkout ${branch}
    #TODO check this configuration
    git pull eayunstack ${branch}
    if [ "i${push}" == "iy" ]
    then
      git push origin ${branch}
    fi
    generate_tags
  done

  cd ${OLDPATH}
}

function sync_src () {
  for repo in ${REPOS}
  do
    fetch_objects ${repo}
    sync_from_upstream ${repo}
    sync_from_eayunstack ${repo}
  done
}

parse_opt
sync_src

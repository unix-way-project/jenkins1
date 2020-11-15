#!/bin/bash

set -e

main() {
  source "${WORKSPACE}/venv/bin/activate"

  if [ "${DELETE_OLD}" == "true" ]; then
      echo "DELETE_OLD variable is set to true"
      export DELETE_OLD_MODE="--delete-old"
  elif [ "${DELETE_OLD}" == "false" ]; then
      echo "DELETE_OLD variable is set to false"
      export DELETE_OLD_MODE=""
  else
      echo "Invalid value for variable DELETE_OLD: ${DELETE_OLD}"
      exit 1
  fi

  pushd "${WORKSPACE}/jenkins-repository/jobs/${EXAMPLE_DIRECTORY}"
  echo "Starting to update the jenkins jobs from the directory $(pwd)"
  jenkins-jobs --conf "${WORKSPACE}/jenkins_jobs.ini" update ${DELETE_OLD_MODE} .
  popd
}

main

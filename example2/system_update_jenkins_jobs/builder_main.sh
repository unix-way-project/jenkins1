#!/bin/bash

set -ex

main() {
  virtualenv -p python3 "${WORKSPACE}/venv"
  source "${WORKSPACE}/venv/bin/activate"
  pip3 install jenkins-job-builder

  pushd "${WORKSPACE}/jenkins-demo/${EXAMPLE_DIRECTORY}"
  echo "Starting to update the jenkins jobs from the directory $(pwd)"
  jenkins-jobs update .
  popd
}

main

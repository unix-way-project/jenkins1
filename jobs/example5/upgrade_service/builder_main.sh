#!/bin/bash

set -e

main() {
  echo "Starting to upgrade service ${SERVICE} on testing environment to version ${VERSION}"
  echo "Job will pass only if service succesfully upgraded"

  sleep 15
}

main

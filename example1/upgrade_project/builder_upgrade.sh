#!/bin/bash

set -ex

main() {
  echo "Starting an upgrade of the project"
  echo "Here we run all the clients to trigger an update"
  echo "For example it can be helm client triggering an upgrade to the existing release on Kubernetes cluster"

  sleep 10
}

main

#!/bin/bash

set -e

main() {
  echo "Starting an upgrade of the service"
  echo "Here we run all the clients to trigger an update"
  echo "For example it can be helm client triggering an upgrade to the existing release on Kubernetes cluster"

  sleep 10
}

main

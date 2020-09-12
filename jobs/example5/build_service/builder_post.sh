#!/bin/bash

set -e

main() {
    echo "Service ${SERVICE} successfully compiled"

    echo "Promotion of version ${VERSION} to artifactory"
    sleep 5
}

main

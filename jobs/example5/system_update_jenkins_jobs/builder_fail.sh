#!/bin/bash

set -e

main() {
    echo "Failed to update Jenkins Jobs from the source"

    rm -rf "${WORKSPACE}/jenkins_jobs.ini"
}

main

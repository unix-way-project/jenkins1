#!/bin/bash

set -e

main() {
    echo "Successfuly updated Jenkins Jobs from the source"

    rm -rf "${WORKSPACE}/jenkins_jobs.ini"
}

main

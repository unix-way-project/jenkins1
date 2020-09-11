#!/bin/bash

set -ex

main() {
  echo "Here we use environment variables DATABASE_HOST, DATABASE_NAME,"
  echo "DATABASE_USER, DATABASE_PASSWORD to establish connection to this database"
  echo "and dump it's content."
  echo "If successful, it will be copied to safe storage disk"
}

main

#!/bin/bash

set -ex

main() {
  echo "Confirming failing upgrade"
  echo "Here we remove all configuration files which can include secrets"
  echo "We can send a notification to email about failed upgrade"
  echo "We can also send a webhook to external system like pager duty creating an alert"
}

main

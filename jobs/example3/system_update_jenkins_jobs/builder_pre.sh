#!/bin/bash

set -e

main() {
  echo "Initializing all clients for upgrading the environments"

  virtualenv -p python3 "${WORKSPACE}/venv"
  source "${WORKSPACE}/venv/bin/activate"
  pip3 install jenkins-job-builder

  cat << EOF > "${WORKSPACE}/jenkins_jobs.ini"
[job_builder]
ignore_cache=True
keep_descriptions=False
include_path=.:scripts:~/git/
recursive=True
exclude=.*:manual:./development
allow_duplicates=False
update=all

[jenkins]
user=${JENKINS_ADMIN_USER}
password=${JENKINS_ADMIN_PASSWORD}
url=${JENKINS_URL}
query_plugins_info=False

[plugin "hipchat"]
authtoken=dummy

[plugin "stash"]
username=user
password=pass
EOF

  cat "${WORKSPACE}/jenkins_jobs.ini"
}

main

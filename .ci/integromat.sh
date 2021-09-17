#!/bin/bash

set -eu

BASEDIR=$(dirname $0)

env

if [ ! -f "${BASEDIR}/ci-normalize-envvars/ci-env.sh" ]; then
    git clone https://github.com/srz-zumix/ci-normalize-envvars.git "${BASEDIR}/ci-normalize-envvars"
fi
. "${BASEDIR}/ci-normalize-envvars/ci-env.sh"

# DATE=$(TZ="Asia/Tokyo" date)
DATE=$(date -u)
NAME=${CI_NAME:-${CI_ENV_NAME}}

curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"time\": \"${DATE}\", \"ci\": \"${NAME}\", \"commit\": \"${CI_ENV_GIT_COMMIT}\" }" \
  "${INTEGROMAT_WEBHOOK_URL}"

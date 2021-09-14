set -eu

BASEDIR=$(dirname $0)

if [ ! -f ${BASEDIR}/ci-normalize-envvars/ci-env.sh ]; then
    git clone https://github.com/srz-zumix/ci-normalize-envvars.git
fi
. ${BASEDIR}/ci-normalize-envvars/ci-env.sh

curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"time\": \"${DATE}\", \"ci\": \"${CI_ENV_NAME}\", \"commit\": \"${CI_ENV_GIT_COMMIT}\" }" \
  ${INTEGROMAT_WEBHOOK_URL}
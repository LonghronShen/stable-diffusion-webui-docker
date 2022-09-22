#!/bin/bash

set -x

# where [ui] is one of: auto | auto-cpu | hlky | lstein
ui=${1:-"auto"}
skip_download=${2}

# set proxy env variables if you need
# export HTTPS_PROXY=
# export HTTP_PROXY=

envsubst < docker-compose.template.yml > docker-compose.local.yml

if [[ -z "$skip_download" ]]; then
    docker compose -f docker-compose.local.yml --profile download up --build
fi

docker compose -f docker-compose.local.yml --profile $ui up --build
#!/bin/bash

set -x

echo "HTTPS_PROXY: ${HTTPS_PROXY}"
echo "HTTP_PROXY: ${HTTP_PROXY}"
echo "NO_PROXY: ${NO_PROXY}"
echo "CLI_ARGS: ${CLI_ARGS}"

bash /docker/mount.sh

# run, -u to not buffer stdout / stderr
python3 -u ../../webui.py \
    --listen --port 7860 \
    --hide-ui-dir-config \
    --ckpt-dir /cache/custom-models \
    --ckpt /cache/models/model.ckpt ${CLI_ARGS}
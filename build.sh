#!/bin/bash
set -e
poetry build
poetry run poetry-lock-package --build

if [ -z "$PIP_INDEX_URL" ];
then
    echo "You should set and authenticated PIP_INDEX_URL if you use a private repository";
fi
export DOCKER_BUILDKIT=1
docker build \
    --secret id=pip_index_url,env=PIP_INDEX_URL \
    .
echo "Now you can run that hash using"
echo "docker run -p 8080:8080 -it <hash reported by build>"
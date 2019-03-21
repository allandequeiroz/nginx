#!/usr/bin/env bash

docker run --rm --privileged multiarch/qemu-user-static:register --reset

#docker rmi allandequeiroz/nginx:ghost-arm64
#docker build --build-arg SERVICE=ghost --build-arg PORT=2368 -t allandequeiroz/nginx:ghost-arm64 -f Dockerfile.arm64 .
#docker push allandequeiroz/nginx:ghost-arm64

docker rmi allandequeiroz/nginx:ghost-amd64
docker build --build-arg SERVICE=ghost --build-arg PORT=2368 -t allandequeiroz/nginx:ghost-amd64 -f Dockerfile.amd64 .
docker push allandequeiroz/nginx:ghost-amd64

#docker rmi allandequeiroz/nginx:wiki-arm64
#docker build --build-arg SERVICE=wiki --build-arg PORT=8080 -t allandequeiroz/nginx:wiki-arm64 -f Dockerfile.arm64 .
#docker push allandequeiroz/nginx:wiki-arm64

docker rmi allandequeiroz/nginx:wiki-amd64
docker build --build-arg SERVICE=wiki --build-arg PORT=8080 -t allandequeiroz/nginx:wiki-amd64 -f Dockerfile.amd64 .
docker push allandequeiroz/nginx:wiki-amd64
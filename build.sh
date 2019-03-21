#!/usr/bin/env bash

push=false
clean=false
clean-all=false
arm=false
amd=false

for i in "$@"
do
    case ${i} in
        --clean )          clean=true
                           ;;
        --clean-all )      clean-all=true
				 				   ;;								  
        --arm )            arm=true
                           ;;
        --amd )            amd=true
								   ;;
		  --push )           push=true
						         ;;									
        --help )           echo -e "Usage : ./build.sh [OPTIONS]"
                           echo -e "\t--clean      Remove the previous created images for the specified architecture"
                           echo -e "\t--clean-all  Remove all the previous created images"
									echo -e "\t--arm        Create ARM images"
									echo -e "\t--amd        Create AMD images"
                           echo -e "\t--push       Push to Docker hub"									
                           exit 0
                           ;;
    esac
    shift
done

docker run --rm --privileged multiarch/qemu-user-static:register --reset

if [ ${clean} == true ] && [ ${arm} == true ]; then
	docker rmi allandequeiroz/nginx:ghost-arm64
	docker rmi allandequeiroz/nginx:wiki-arm64
fi	

if [ ${clean} == true ] && [ ${amd} == true ]; then
	docker rmi allandequeiroz/nginx:ghost-amd64
	docker rmi allandequeiroz/nginx:wiki-amd64
fi	

if [ ${arm} == true ]; then
	docker build --build-arg SERVICE=ghost --build-arg PORT=2368 -t allandequeiroz/nginx:ghost-arm64 -f Dockerfile.arm64 .
	docker build --build-arg SERVICE=wiki --build-arg PORT=8080 -t allandequeiroz/nginx:wiki-arm64 -f Dockerfile.arm64 .
fi	

if [ ${amd} == true ]; then
	docker build --build-arg SERVICE=ghost --build-arg PORT=2368 -t allandequeiroz/nginx:ghost-amd64 -f Dockerfile.amd64 .
	docker build --build-arg SERVICE=wiki --build-arg PORT=8080 -t allandequeiroz/nginx:wiki-amd64 -f Dockerfile.amd64 .
fi

if [ ${push} == true ] && [ ${arm} == true ]; then
	docker push allandequeiroz/nginx:ghost-arm64
	docker push allandequeiroz/nginx:wiki-arm64
fi	

if [ ${push} == true ] && [ ${arm} == true ]; then
	docker push allandequeiroz/nginx:ghost-arm64
	docker push allandequeiroz/nginx:wiki-arm64
fi	

if [ ${push} == true ] && [ ${amd} == true ]; then
	docker push allandequeiroz/nginx:ghost-amd64
	docker push allandequeiroz/nginx:wiki-amd64
fi	
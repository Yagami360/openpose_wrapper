#!/bin/sh
set -eu

CONTAINER_NAME=openpose-gpu-container
IMAGE_DIR=sample_n5
WRITE_JSON=results_json
WRITE_IMAGE=results_image

mkdir -p ${IMAGE_DIR}
mkdir -p ${WRITE_JSON}
mkdir -p ${WRITE_IMAGE}

docker-compose -f docker-compose_gpu.yml stop
docker-compose -f docker-compose_gpu.yml up -d
sleep 5

docker exec -it -u $(id -u $USER):$(id -g $USER) ${CONTAINER_NAME} /bin/bash -c "cd openpose_gpu && \
    ./build/examples/openpose/openpose.bin \
        --model_pose COCO \
        --image_dir ../${IMAGE_DIR} --write_json ../${WRITE_JSON} --write_images ../${WRITE_IMAGE} \
        --display 0 \
        --hand"

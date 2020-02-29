#!/bin/sh
#./build/examples/openpose/openpose.bin --model_pose COCO --image_dir ../sample_n5 --write_json ../results_json --display 0 --render_pose 0 --hand
#openpose/build/examples/openpose/openpose.bin --model_pose COCO --image_dir sample_n5 --write_json results_json --display 0 --render_pose 0 --hand
set -e
CONTAINER_NAME=openpose_ubuntu_gpu_container

docker-compose -f docker-compose_gpu.yml stop
docker-compose -f docker-compose_gpu.yml up -d
docker exec -it -u $(id -u $USER):$(id -g $USER) ${CONTAINER_NAME} bash

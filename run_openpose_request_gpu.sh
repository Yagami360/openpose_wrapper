#!/bin/sh
set -eu

docker-compose -f docker-compose_gpu.yml stop
docker-compose -f docker-compose_gpu.yml up -d
sleep 5

#HOST_NAME=localhost
#HOST_NAME=openpose_ubuntu_gpu_container
HOST_NAME=0.0.0.0

cd openpose_server
python request.py \
    --host ${HOST_NAME} --port 5010 \
    --image_dir ../sample_n5 \
    --write_json ../results_json \
    --debug

#    --write_images ../results_image \
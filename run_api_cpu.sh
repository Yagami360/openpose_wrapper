#!/bin/sh
set -e
HOST=0.0.0.0
POST=5011

# API 起動
docker-compose -f docker-compose_cpu.yml stop
docker-compose -f docker-compose_cpu.yml up -d

# リクエスト処理
cd openpose_server
python request.py \
    --host ${HOST} --port ${POST} \
    --image_dir ../sample_n5 \
    --write_json ../results_json \
    --write_images ../results_image \
    --debug

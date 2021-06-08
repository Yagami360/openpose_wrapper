#!/bin/sh
set -e
HOST=0.0.0.0
POST=5010

# API 起動
docker-compose -f docker-compose_gpu.yml stop
docker-compose -f docker-compose_gpu.yml up -d

# リクエスト処理
cd openpose_server
python request.py \
    --host ${HOST} --port ${POST} \
    --image_dir ../sample_n5 \
    --write_json ../results_json \
    --debug

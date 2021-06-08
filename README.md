# openpose_wrapper
OpenPose のラッパーモジュール。<br>
以下の機能を追加しています。<br>
- Docker を用いて OpenPose のインストールから実行までを自動的に行う。
- サーバー機能を追加。<br>

現在 GPU 版のみ動作します。<br>

<!--
GPU 版 OpenPose と CPU 版 OpenPose の両方に対応しています。<br>
-->

## ■ 目次

1. [動作環境](#動作環境)
1. [使用法](#使用法)
    1. [サーバー機能を使用しない場合](#サーバー機能を使用しない場合)
        1. [GPU 版 OpenPose](#サーバー機能を使用しない場合_GPU版OpenPose)
        1. [CPU 版 OpenPose](#サーバー機能を使用しない場合_CPU版OpenPose（CPU版OpenPose）)
    1. [サーバー機能を使用する場合](#サーバー機能を使用する場合)
        1. [GPU 版 OpenPose](#サーバー機能を使用する場合_GPU版OpenPose)
        1. [CPU 版 OpenPose](#サーバー機能を使用する場合_CPU版OpenPose)
1. [【参考】 OpenPose の主なオプション引数](#【参考】OpenPoseの主なオプション引数)

<a id="動作環境"></a>

## ■ 動作環境

- Ubuntu :
- docker, docker-compose
- GPU 版 OpenPose
    - nvidia 製 GPU 搭載マシン
    - CUDA 10.1 
    - nvidia-docker2
- リクエスト処理 : `openpose_server/request.py`
    - tqdm
    - requests
    - Pillow

<a id="使用法"></a>

## ■ 使用法

<a id="サーバー機能を使用しない場合"></a>

### ◎ サーバー機能を使用しない場合

<a id="サーバー機能を使用しない場合_GPU版OpenPose"></a>

#### ☆ GPU 版 OpenPose
「Ubuntu + GPU 版 OpenPose」の Docker イメージを使用して、コンテナ内で OpenPose を実行します。Docker イメージの作成には長時間がかかります。

<!--
- Docker イメージの作成＆コンテナの起動<br>
    以下のコマンドを実行。
    ```sh
    $ sh run_docker-compose_gpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    # コマンド例（docker-compose を使用する場合）
    $ docker-compose -f docker-compose_gpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_gpu_container bash
    ```
-->

- Docker イメージの作成 ＆ OpenPose の実行<br>
    以下のコマンドを実行。
    ```sh
    $ sh run_openpose_gpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    $ docker-compose -f docker-compose_gpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_gpu_container bash

    # コンテナ内 : /home/ubuntu/share/openpose_wrapper
    $ cd openpose_gpu

    # コンテナ内 : /home/ubuntu/share/openpose_wrapper/openpose_gpu で OpenPose 実行
    $ ./build/examples/openpose/openpose.bin \
        --model_pose COCO \
        --image_dir ../sample_n5 --write_json ../results_json --write_images ../results_image \
        --display 0 \
        --hand
    ```

<a id="サーバー機能を使用しない場合_CPU版OpenPose"></a>

#### ☆ CPU 版 OpenPose
準備中...

<!--
CPU で OpenPose を使用する場合は、こちらのイメージを使用してください。<br>

- Docker イメージの作成＆コンテナの起動
    以下のコマンドを実行。
    ```sh
    $ sh run_docker-compose_cpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    $ docker-compose -f docker-compose_cpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_cpu_container bash
    ```

- OpenPose の実行（サーバー機能非使用）<br>
    以下のコマンドを実行。
    ```sh
    $ sh run_openpose_cpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    $ docker-compose -f docker-compose_cpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_cpu_container bash

    # コンテナ内 : /home/ubuntu/share/openpose_wrapper
    $ cd openpose_cpu

    # コンテナ内 : /home/ubuntu/share/openpose_wrapper/openpose_cpu で OpenPose 実行
    $ ./build/examples/openpose/openpose.bin \
        --model_pose COCO \
        --image_dir ../sample_n5 --write_json ../results_json --write_images ../results_image \
        --display 0 \
        --hand
    ```
-->

<a id="サーバー機能を使用する場合"></a>

### ◎ サーバー機能を使用する場合

<a id="サーバー機能を使用する場合_GPU版OpenPoseサーバー"></a>

#### ☆ GPU 版 OpenPose サーバー
サーバー機能非使用時の GPU 版 Docker イメージと同様のイメージを使用し、コンテナ内でサーバーを起動して OpenPose を実行します。<br>
サーバー機能使用時は、デフォルト設定では、5010 番ポートが開放されている必要があります。
使用するポート番号は、`docker-compose_gpu.yml` 内の `ports:` タグ、及び、`openpose_server/app.py`, `openpose_server/request.py` の `--port` 引数の値を設定することで変更できます。<br>

<!--
- Docker イメージの作成＆コンテナの起動<br>
    以下のコマンド例を実行。
    ```sh
    # コマンド例（docker-compose を使用する場合）
    $ docker-compose -f docker-compose_gpu.yml up -d
    ```
-->

- Docker イメージの作成 ＆ コンテナの起動 ＆ リクエスト処理<br>
    以下のコマンドを実行。
    ```sh
    $ sh run_api_gpu.sh
    ```

    又は、以下のコマンドを実行
    ```sh
    # API の起動
    $ docker-compose -f docker-compose_gpu.yml stop
    $ docker-compose -f docker-compose_gpu.yml up -d

    # OpenPose サーバーへのリクエスト処理
    $ cd openpose_server
    $ python request.py \
        --host 0.0.0.0 --port 5010 \
        --image_dir ../sample_n5 \
        --write_json ../results_json
    ```

<a id="サーバー機能を使用する場合_CPU版OpenPoseサーバー"></a>

#### ☆ CPU 版 OpenPose サーバー
準備中...

<a id="【参考】OpenPoseの主なオプション引数"></a>

## 【参考】 OpenPose の主なオプション引数

- `--help`: 全てのコマンドオプションを表示
- `--face`: 顔検出を有効にする
- `--hand`: 手検出を有効にする
- `--video` input.mp4: 動画の読み込み
- `--camera` 3: Webカメラ番号を指定(複数カメラがある場合)
- `--image_dir` path_to_images\: 静止画像フォルダを指定
- `--ip_camera` http://iris.not.iac.es/axis-cgi/mjpg/video.cgi?resolution=320x240?x.mjpeg: IPカメラを使用
- `--write_video` path.avi: 動画出力
- `--write_images` folder_path: 静止画出力
- `--write_keypoint` path\: JSON, XML or YMLファイル出力
- `--write_json` path\: JSON形式でファイル出力
- `--part_candidates`: JSON形式のフォーマットをパーツ番号とともに出力する
- `--process_real_time`: 動画像ファイルのリアルタイム処理
- `--disable_blending`: keypoint skeltonsまたはheatmapのみを表示
- `--part_to_show`: 指定したパーツのみ表示 パーツ
- `--display` 0: 結果表示しない(若干速度向上)
- `--num_gpu` 2 --num_gpu_start 1: GPU数の指定(デフォルトは全部使用)
- `--model_pose` MPI: 使用するモデルを指定
- `--logging_level` 3: Debug用ログ出力(0:全部, 1-4:レベル, 255:なし)
- `--render_pose` 0を指定を指定すると表示なし

- 参考
    - [OpenPose - コマンド一覧](https://qiita.com/wada-n/items/e9e6653effc1e3d0c566)

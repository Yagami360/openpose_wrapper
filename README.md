# openpose_wrapper
OpenPose のラッパーモジュール。<br>
Docker を用いて OpenPose のインストールから実行までを自動的に行います。<br>
現在 GPU 版のみ動作します。

<!--
GPU 版 OpenPose と CPU 版 OpenPose の両方に対応しています。<br>
-->

## ■ 動作環境
docker-compose 環境で動作します。

## ■ 使用法

### ◎ Ubuntu 16.04 + GPU 版 OpenPose の Docker イメージ
nvidia 製 GPU で OpenPose を使用する場合は、こちらのイメージを使用してください。nvidia-docker2 で動作します。

- Docker イメージの作成＆コンテナの起動
    以下のコマンドを実行。
    ```sh
    $ sh run_docker-compose_gpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    # コマンド例
    $ docker-compose -f docker-compose_gpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_gpu_container bash
    ```

- OpenPose の実行<br>
    Docker コンテナに入ったあと、以下のコマンドを実行。
    ```sh
    # /home/ubuntu/share/openpose_wrapper
    $ sh run_openpose_gpu.sh
    ```

    又は、以下のコマンド例を実行。
    ```sh
    # /home/ubuntu/share/openpose_wrapper
    $ cd openpose_gpu

    # コマンド例
    $ ./build/examples/openpose/openpose.bin \
        --model_pose COCO \
        --image_dir ../sample_n5 --write_json ../results_json --write_images ../results_image \
        --display 0 \
        --hand
    ```

### ◎ Ubuntu 16.04 + CPU 版 OpenPose の Docker イメージ
準備中...

<!--
CPU で OpenPose を使用する場合は、こちらのイメージを使用してください。<br>

- Docker イメージの作成＆コンテナの起動（docker-compose を用いる場合）
    ```sh
    $ docker-compose -f docker-compose_cpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_cpu_container bash
    ```
-->

### ◎ OpenPose の主なオプション引数

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

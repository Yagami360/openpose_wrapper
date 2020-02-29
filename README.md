# openpose_wrapper
OpenPose のラッパーモジュール。<br>
Docker を用いて OpenPose のインストールから実行までを自動的に行います。<br>

<!--
GPU 版 OpenPose と CPU 版 OpenPose の両方に対応しています。<br>
-->

## ■ 動作環境
Docker 環境で動作します。

### ◎ Ubuntu 16.04 + GPU 版 OpenPose の Docker イメージ
nvidia 製 GPU で OpenPose を使用する場合は、こちらのイメージを使用してください。<br>
nvidia-docker2 で動作します。

- Docker イメージの作成＆コンテナの起動（docker-compose を用いる場合）
    ```sh
    $ docker-compose -f docker-compose_gpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_gpu_container bash
    ```

<!--
### ◎ Ubuntu 16.04 + CPU 版 OpenPose の Docker イメージ
CPU で OpenPose を使用する場合は、こちらのイメージを使用してください。<br>

- Docker イメージの作成＆コンテナの起動（docker-compose を用いる場合）
    ```sh
    $ docker-compose -f docker-compose_cpu.yml up -d
    $ docker exec -it -u $(id -u $USER):$(id -g $USER) openpose_ubuntu_cpu_container bash
    ```
-->

## ■ 使用法

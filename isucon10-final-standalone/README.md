# vagrant-isucon/isucon10-final-standalone

## Overview

isucon10本選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

* vagrant実行環境を用意する
* このリポジトリ内のVagrantfileを手元に用意する
  * 必要に応じてVagrantfileを編集する
* Vagrantfileがあるディレクトリで`vagrant up`を実行する
  * サーバが1台起動
* Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
  ```sh
   vagrant ssh
  ```
* 各種サービス起動
  ```sh
  sudo systemctl start envoy
  sudo systemctl start xsuportal-api-$LANGUAGE.service
  sudo systemctl start xsuportal-web-$LANGUAGE.service
  ```
* ベンチマークを実行する
  ```sh
  sudo -i -u isucon
  cd benchmarker
  bin/benchmarker
  ```

## 動作確認

macOS + VirtualBox 6.1.20 + Vagrant 2.2.15で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバのスペックは[isucon/isucon10-final](https://github.com/isucon/isucon10-final)を確認してください。

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON10本選問題](https://github.com/isucon/isucon10-final)

### Vagrantがない環境で試したい

[isucon/isucon10-final](https://github.com/isucon/isucon10-final)をご利用ください。

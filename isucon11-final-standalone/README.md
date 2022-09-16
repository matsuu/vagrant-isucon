# vagrant-isucon/isucon11-final-standalone

## Overview

isucon11本選とほぼ同じ環境を構築するためのVagrantfileです。

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
* ベンチマークを実行する
  ```sh
  sudo -i -u isucon
  cd benchmarker
  ./bin/benchmarker -target localhost:443 -tls
  ```

## 動作確認

macOS + VirtualBox 6.1.26 + Vagrant 2.2.18で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはc5.largeをベースにメモリを2GB制限(CPU 2コア、メモリ2GB)の3台構成です
* 本来のベンチマークサーバはc4.xlarge(CPU 4コア、メモリ7.5GB)です
* SSL証明書は自己署名のものを用意しています

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON11本選問題](https://github.com/isucon/isucon11-final)

### Vagrantがない環境で試したい

[isucon/isucon11-final](https://github.com/isucon/isucon11-final)をご利用ください。

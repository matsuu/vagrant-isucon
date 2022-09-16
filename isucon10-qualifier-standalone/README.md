# vagrant-isucon/isucon10-qualifier-standalone

## Overview

isucon10予選とほぼ同じ環境を構築するためのVagrantfileです。

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
  cd isuumo/bench
  ./bench -target-url http://127.0.0.1
  ```

## 動作確認

macOS + VirtualBox 6.1.14 + Vagrant 2.2.10で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはCPU 2コア、メモリ1GBの3台構成です。

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON10予選問題](https://github.com/isucon/isucon10-qualify)

### Vagrantがない環境で試したい

[isucon/isucon10-qualify](https://github.com/isucon/isucon10-qualify)をご利用ください。

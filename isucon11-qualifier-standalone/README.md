# vagrant-isucon/isucon11-qualifier-standalone

## Overview

isucon11予選とほぼ同じ環境を構築するためのVagrantfileです。

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
  cd bench
  # 本番同様にnginx(https)へアクセスを向けたい場合
  ./bench -all-addresses 127.0.0.11 -target 127.0.0.11:443 -tls -jia-service-url http://127.0.0.1:4999
  # isucondition(3000)へ直接アクセスを向けたい場合
  ./bench -all-addresses 127.0.0.11 -target 127.0.0.11:3000 -jia-service-url http://127.0.0.1:4999
  ```

## 動作確認

macOS + VirtualBox 6.1.26 + Vagrant 2.2.18で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはc5.large(CPU 2コア、メモリ4GB)の3台構成です
* 本来のベンチマークサーバはc4.xlarge(CPU 4コア、メモリ7.5GB)です
* SSL証明書は自己署名のものを用意しています
* 1台構成で動作するように以下のファイルを書き換えています
    * /etc/hosts
    * /var/lib/cloud/scripts/per-instance/generate-env.sh

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON11予選問題](https://github.com/isucon/isucon11-qualify)

### Vagrantがない環境で試したい

[isucon/isucon11-qualify](https://github.com/isucon/isucon11-qualify)をご利用ください。

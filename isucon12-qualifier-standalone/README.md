# vagrant-isucon/isucon12-qualifier-standalone

## Overview

isucon12予選とほぼ同じ環境を構築するためのVagrantfileです。

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
  ./bench -target-addr 127.0.0.1:443
  ```

## 動作確認

macOS + VirtualBox 6.1.36 + Vagrant 2.2.19で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはc5.large(CPU 2コア、メモリ4GB)の3台構成です
* 本番ではドメインとして `*.t.isucon.dev` が使われていましたが、[devトップレベルドメインはHSTS preload-listに含まれており](https://ja.wikipedia.org/wiki/.dev)、正規のSSL証明書がないとアクセスできないため `*.t.isucon.local` に書き換えています
* SSL証明書は自己署名のものを用意しています
* 1台構成で動作するように以下のファイルを書き換えています
    * /etc/hosts

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON12予選問題](https://github.com/isucon/isucon12-qualify)

### Vagrantがない環境で試したい

[isucon/isucon12-qualify](https://github.com/isucon/isucon12-qualify)をご利用ください。

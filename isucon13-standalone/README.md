# vagrant-isucon/isucon13-standalone

## Overview

isucon13とほぼ同じ環境を構築するためのVagrantfileです。

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
  ./bench run --enable-ssl
  ```

## 動作確認

macOS + VirtualBox 7.0.12 + Vagrant 2.4.0で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはc5.large(CPU 2コア、メモリ4GB)の3台構成です
* 本番ではドメインとして `*.u.isucon.dev` が使われていましたが、[devトップレベルドメインはHSTS preload-listに含まれており](https://ja.wikipedia.org/wiki/.dev)、正規のSSL証明書がないとアクセスできないため `*.u.isucon.local` に書き換えています
* SSL証明書は自己署名のものを用意しています

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### ブラウザでの動作確認方法

手元のPCのhostsファイルに以下を追記してください。

```
${サーバのIPアドレス} pipe.u.isucon.local
```

追記したらブラウザから https://pipe.u.isucon.local/ にアクセスしてみてください。

### プログラムの動かし方がわからない

以下をご確認ください。

* [ISUCON13問題](https://github.com/isucon/isucon13)

### Vagrantがない環境で試したい

[isucon/isucon13](https://github.com/isucon/isucon13)の `provisioning/ansible` をご利用ください。

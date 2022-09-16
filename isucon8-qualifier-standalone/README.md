# vagrant-isucon/isucon8-qualifier-standalone

## Overview

isucon8予選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

- vagrant実行環境を用意する
- このリポジトリ内のVagrantfileを手元に用意する
  - 必要に応じてVagrantfileを編集する
- Vagrantfileがあるディレクトリで`vagrant up`を実行する
  - サーバが1台起動
- Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
  - vagrant ssh
- ベンチマークを実行する
  - sudo -i -u isucon
  - cd torb/bench
  - bin/bench -remotes=127.0.0.1 -output result.json

## 動作確認

macOS + VirtualBox 5.2.18 + Vagrant 2.1.5で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- 本来のサーバは(CPU 2コア、メモリ1GB)の3台構成です。

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON8予選問題](https://github.com/isucon/isucon8-qualify)

### Vagrantがない環境で試したい

[isucon/isucon8-qualify](https://github.com/isucon/isucon8-qualify)をご利用ください。

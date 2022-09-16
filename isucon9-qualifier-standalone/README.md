# vagrant-isucon/isucon9-qualifier-standalone

## Overview

isucon9予選とほぼ同じ環境を構築するためのVagrantfileです。

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
  - cd isucari
  - bin/benchmarker

## 動作確認

macOS + VirtualBox 6.0.12 + Vagrant 2.2.5で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- 本来のサーバはecs.sn1ne.large(CPU 2コア、メモリ4GB)の1〜3台構成です。

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON9予選問題](https://github.com/isucon/isucon9-qualify)

### Vagrantがない環境で試したい

[isucon/isucon9-qualify](https://github.com/isucon/isucon9-qualify)をご利用ください。

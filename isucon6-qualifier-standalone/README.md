# vagrant-isucon/isucon6-qualifier-standalone

## Overview

isucon6予選とほぼ同じ環境を構築するためのVagrantfileです。

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
  - cd isucon6q
  - ./isucon6q-bench -target http://127.0.0.1

## 動作確認

Mac OS X + VirtualBox 5.0.28 + Vagrant 1.8.6で動作確認済です。

## 本来の設定と異なるところ

- 本来のサーバはD2 v2(vCPU 2, メモリ7.0GB)ですが、メモリーの割り当ては2GBに設定しています

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON6 予選マニュアル](https://github.com/isucon/isucon6-qualify/blob/master/Regulation.md)

### 初期状態でベンチマークのスコアが0になる

仕様です。頑張ってチューニングしましょう。

### Vagrantがない環境で試したい

Ubuntu環境を用意できるのであれば[本家ansible](https://github.com/isucon/isucon6-qualify)をご利用ください。

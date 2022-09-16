# vagrant-isucon/isucon7-qualifier

## Overview

isucon7予選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

- vagrant実行環境を用意する
- このリポジトリ内のVagrantfileを手元に用意する
  - 必要に応じてVagrantfileを編集する
- Vagrantfileがあるディレクトリで`vagrant up`を実行する
  - ベンチマーク用サーバ(bench)と参加者用サーバ(image)が起動
- Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
  - vagrant ssh bench
  - vagrant ssh image
- ベンチマークを実行する
  - sudo -i -u isucon
  - cd isubata/bench
  - bin/bench -remotes (imageサーバのIPアドレス)

## 動作確認

macOS + VirtualBox 5.1.28 + Vagrant 2.0.0で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- 本来のサーバは(CPU 1コア、メモリ1GB)の3台構成ですが、初期のメモリー割り当ては2GBに設定しています(プロビジョニング中にDBデータ流し込みでメモリ不足となるため)。

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON7予選問題](https://github.com/isucon/isucon7-qualify)

### Vagrantがない環境で試したい

Ubuntu環境を用意できるのであれば[matsuu/ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

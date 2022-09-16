# vagrant-isucon/isucon5-qualifier-standalone

## Overview

isucon5予選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

- vagrant実行環境を用意する
- このリポジトリ内のVagrantfileを手元に用意する
  - 必要に応じてVagrantfileを編集する
- Vagrantfileがあるディレクトリで`vagrant up`を実行する
- Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
- /home/isucon/bench.shを実行する

## 動作確認

Mac OS X + VirtualBox 5.0.4 + Vagrant 1.7.4で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- 本来はn1-highcpu-4(vCPU 4, メモリ3.60GB)のサーバですが、メモリーの割り当ては2GBに設定しています
- Ubuntu 15.04はサポートが終了したためUbuntu 16.04に差し替えました
- 本来はベンチマークプログラムと本体が異なるサーバの構成ですが、このVagrantは両方を1台のサーバに収めています

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON5 予選レギュレーション](http://isucon.net/archives/45347574.html)
- [ISUCON5 予選マニュアル](https://gist.github.com/tagomoris/1a2df5ab0999f5e64cff)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### Vagrantがない環境で試したい

Ubuntu環境を用意できるのであれば[ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

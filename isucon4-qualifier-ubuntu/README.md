# vagrant-isucon/isucon4-qualifier

## Overview

isucon4予選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

- vagrant実行環境を用意する
- このリポジトリ内のVagrantfileを手元に用意する
  - 必要に応じてVagrantfileを編集する
- Vagrantfileがあるディレクトリで`vagrant up`を実行する
- Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する

## 動作確認

Mac OS X + VirtualBox 5.0 + Vagrant 1.7.4で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- MySQLのバージョンを5.5.42からMySQL GA最新版(現在は5.6系)に変更しています
- ログインユーザをec2-userからvagrantに変更しています
- ベンチマークプログラムのインスタンスチェックを削除しています
- 本来のサーバはAWS m3.xlarge(vCPU 4, メモリ15GB)ですが、メモリーの割り当ては2GBに設定しています

## FAQ

[トップのFAQ](../README.md)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON4(2014) オンライン予選レギュレーション](http://isucon.net/archives/39979344.html)
- [ISUCON4 予選当日マニュアル](https://gist.github.com/mirakui/e394ed543415852d34a6)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### Vagrantがない環境で試したい

CentOS6環境を用意できるのであれば[ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

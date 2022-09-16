# vagrant-isucon/isucon3-qualifier

## Overview

isucon3予選とほぼ同じ環境を構築するためのVagrantfileです。

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

- goのバージョンを依存関係解決のため1.1.2から1.3に変更しています
- phpのバージョンを5.4系(Amazon Linux標準)から5.3系(CentOS6標準)に変更しています
- rubyのバージョンを依存関係解決のため2.0.0p247から2.0.0p645に変更しています
- MySQLのバージョンを5.6.14からMySQL GA最新版(現在は5.6系)に変更しています
- MySQLの起動スクリプトを/etc/init.d/mysqlから/etc/init.d/mysqldに変更しています
- ログインユーザをec2-userからvagrantに変更しています
- supervisordの起動スクリプトをLSB準拠に修正しています
- 本来のサーバはAWS m3.xlarge(vCPU 4, メモリ15GB)ですが、メモリーの割り当ては2GBに設定しています

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON3(2013) オンライン予選レギュレーション](http://isucon.net/archives/31526183.html)
- [オンライン予選で使用した問題が手元で再現できるAMIを公開しました](http://isucon.net/archives/32971265.html)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### Vagrantがない環境で試したい

CentOS6環境を用意できるのであれば[ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

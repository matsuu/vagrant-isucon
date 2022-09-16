# vagrant-isucon/isucon2

## Overview

isucon2とほぼ同じ環境を構築するためのVagrantfileです。

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

- rubyのバージョンを依存関係解決のため1.9.3p551に変更しています
- MySQLのバージョンを5.5からMySQL GA最新版(現在は5.6系)に変更しています
- Javaがうまくコンパイルできないので諦めました
- 本来のサーバは4台構成ですが、Vagrantfileで構築するのは1台のみです

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

- [自家製 #isucon2 のつくりかた](http://blog.livedoor.jp/techblog/archives/67728751.html)
- [Isucon2 regulation](http://www.slideshare.net/tagomoris/isucon2-regulation)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### Vagrantがない環境で試したい

CentOS6環境を用意できるのであれば[ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

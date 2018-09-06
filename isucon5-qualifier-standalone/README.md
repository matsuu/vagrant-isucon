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

### virtualboxで以下のようなエラーメッセージが表示される

> The provider 'virtualbox' that was requested to back the machine
> 'default' is reporting that it isn't usable on this system. The
> reason is shown below:
> 
> Vagrant has detected that you have a version of VirtualBox installed
> that is not supported. Please install one of the supported versions
> listed below to use Vagrant:
> 
> 4.0, 4.1, 4.2, 4.3

Vagrantのバージョンが古い可能性があります。最新のVagrantを使用してください。

### vagrant upを実行するとvboxsfのエラーが表示される

> Failed to mount folders in Linux guest. This is usually because
> the "vboxsf" file system is not available. Please verify that
> the guest additions are properly installed in the guest and
> can work properly. The command attempted was:
> 
> mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
> mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant
> 
> The error output from the last command was:
> 
> /sbin/mount.vboxsf: mounting failed with the error: No such device

[これと同じ現象](http://qiita.com/hapicky/items/a7f9d56588f96d005fad)と思われます。気にせず`vagrant provision`を実行してください。

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON5 予選レギュレーション](http://isucon.net/archives/45347574.html)
- [ISUCON5 予選マニュアル](https://gist.github.com/tagomoris/1a2df5ab0999f5e64cff)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### ブラウザで動作確認ができない

Vagrantfileのネットワーク設定がデフォルトのままなので適当に変更してください。
よくわからない場合は`# config.vm.network "private_network", ip: "192.168.33.10"`のコメントを外してブラウザから192.168.33.10にアクセスしてみてください。

### Vagrantがない環境で試したい

Ubuntu環境を用意できるのであれば[ansible-isucon](https://github.com/matsuu/ansible-isucon)をご利用ください。

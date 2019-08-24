# vagrant-isucon/isucon5-final

## Overview

isucon5決勝とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

- vagrant実行環境を用意する
- このリポジトリ内のVagrantfileを手元に用意する
  - 必要に応じてVagrantfileを編集する
- Vagrantfileがあるディレクトリで`vagrant up`を実行する
  - 以下の3台のサーバが起動
    - ベンチマーク用サーバ(bench)
    - 参加者用サーバ(image)
    - API用サーバ(api)
- Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
  - vagrant ssh bench
  - vagrant ssh image
  - vagrant ssh api
- ベンチマーク用サーバでベンチマークを実行する
  - /home/isucon/bench.sh

## 動作確認

Mac OS X + VirtualBox 5.0.4 + Vagrant 1.7.4で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

- メモリはデフォルトでは以下のように設定していますが本番と異なる可能性があります
  - bench 1024MB
  - image 1024MB
  - api 2048MB
- imageサーバは本来3台用意されるべきですが、デフォルトは1台のみです

## FAQ

### `vagrant up` でBoxのダウンロードが404 Not Foundのエラーになる

Vagrantのバージョンが古いためと思われます。
可能であれば最新バージョンのVagrantをご利用ください。
諸事情により古いVagrantしか使えない場合はVagrantfileの先頭に以下を設定してください。

```
Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')
```

参考 #24

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

- [ISUCON5 決勝レギュレーション](https://github.com/isucon/isucon5-final/blob/master/regulation.md)

### 初期状態でベンチマークのスコアが0になる

メモリーの割り当てが少なすぎる可能性があります。
Vagrantfileを編集してメモリーの割り当てを増やしてみてください。

### ブラウザで動作確認ができない

デフォルトでは参加者用サーバに192.168.55.11を割り当てています。環境に合わせて適当に変更してください。

### 参考

- [isucon/isucon5-final](https://github.com/isucon/isucon5-final)

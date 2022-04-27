# vagrant-isucon/isucon11-final-standalone

## Overview

isucon11本選とほぼ同じ環境を構築するためのVagrantfileです。

## Usage

* vagrant実行環境を用意する
* このリポジトリ内のVagrantfileを手元に用意する
  * 必要に応じてVagrantfileを編集する
* Vagrantfileがあるディレクトリで`vagrant up`を実行する
  * サーバが1台起動
* Ansibleによるプロビジョニングが完了したら`vagrant ssh`を実行する
  ```sh
   vagrant ssh
  ```
* ベンチマークを実行する
  ```sh
  sudo -i -u isucon
  cd benchmarker
  ./bin/benchmarker -target localhost:443 -tls
  ```

## 動作確認

macOS + VirtualBox 6.1.26 + Vagrant 2.2.18で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはc5.largeをベースにメモリを2GB制限(CPU 2コア、メモリ2GB)の3台構成です
* 本来のベンチマークサーバはc4.xlarge(CPU 4コア、メモリ7.5GB)です
* SSL証明書は自己署名のものを用意しています

## FAQ

### `vagrant up` でBoxのダウンロードが404 Not Foundのエラーになる

Vagrantのバージョンが古いためと思われます。
可能であれば最新バージョンのVagrantをご利用ください。
諸事情により古いVagrantしか使えない場合はVagrantfileの先頭に以下を設定してください。

```
Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')
```

参考 https://github.com/matsuu/vagrant-isucon/pull/24

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

### vagrant upを実行するとcode NS\_ERROR\_FAILUREのエラーが発生する

> There was an error while executing `VBoxManage`, a CLI used by Vagrant
> for controlling VirtualBox. The command and stderr is shown below.
>
> Command: ["startvm", "...", "--type", "headless"]
>
> Stderr: VBoxManage: error: The virtual machine '...' has terminated unexpectedly during startup with exit code 1 (0x1)
> VBoxManage: error: Details: code NS\_ERROR\_FAILURE (0x80004005), component MachineWrap, interface IMachine

VirtualBoxの問題と思われます。VirtualBoxを再インストールした上でOS再起動してみてください。

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON11本選問題](https://github.com/isucon/isucon11-final)

### ブラウザで動作確認ができない

Vagrantfileのネットワーク設定がデフォルトのままなので、サーバに割り当てられたIPアドレスにブラウザでアクセスしてみてください。
よくわからない場合は`# config.vm.network "private_network", ip: "192.168.33.10"`のコメントを外してブラウザから192.168.33.10にアクセスしてみてください。

### Vagrantがない環境で試したい

[isucon/isucon11-final](https://github.com/isucon/isucon11-final)をご利用ください。

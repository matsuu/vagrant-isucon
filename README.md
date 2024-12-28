# vagrant-isucon

## Overview

[ISUCON](http://isucon.net/)の過去問を構築するためのVagrantfileです。

| 回 | 予選 | 本選 |
| --- | --- | --- |
| ISUCON1 | x | TBD |
| ISUCON2 | x | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon2) |
| ISUCON3 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon3-qualifier) | TBD |
| ISUCON4 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon4-qualifier) | TBD |
| ISUCON5 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-qualifier-standalone) [2台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-qualifier) | [3台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon5-final) |
| ISUCON6 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon6-qualifier-standalone) [2台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon6-qualifier) | TBD |
| ISUCON7 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon7-qualifier-standalone) [2台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon7-qualifier) [VagrantBox](https://app.vagrantup.com/matsuu/boxes/isucon7-qualifier) | TBD |
| ISUCON8 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon8-qualifier-standalone) [2台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon8-qualifier) | TBD |
| ISUCON9 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon9-qualifier-standalone) | TBD |
| ISUCON10 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon10-qualifier-standalone) | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon10-final-standalone) |
| ISUCON11 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon11-qualifier-standalone) | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon11-final-standalone) |
| ISUCON12 | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon12-qualifier-standalone) | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon12-final-standalone) |
| ISUCON13 | | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon13-standalone) |
| ISUCON14 | | [1台構成](https://github.com/matsuu/vagrant-isucon/tree/master/isucon14-standalone) |

サーバ内の構築にはAnsibleを使っています。Ansibleのplaybookのみ必要な場合は[matsuu/ansible-isucon](https://github.com/matsuu/ansible-isucon)をどうぞ。

### Others

- [ISUCONの過去問を予選通過スコアまでチューニングするVagrantfile](https://github.com/matsuu/vagrant-isucon-pass)
- [vagrant-pixiv-isucon2016](https://github.com/matsuu/vagrant-pixiv-isucon2016)
- [vagrant-yisucon](https://github.com/matsuu/vagrant-yisucon)
- [ISUCON 事前講習2021](https://github.com/matsuu/vagrant-isucon11-prior)
- [docker-isucon](https://github.com/matsuu/docker-isucon)

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

### ブラウザで動作確認ができない

Vagrantfileのネットワーク設定がデフォルトのままなので、サーバに割り当てられたIPアドレスにブラウザでアクセスしてみてください。
よくわからない場合は`# config.vm.network "private_network", ip: "192.168.33.10"`のコメントを外してブラウザから192.168.33.10にアクセスしてみてください。

## License

MIT

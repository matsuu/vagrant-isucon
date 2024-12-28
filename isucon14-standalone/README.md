# vagrant-isucon/isucon14-standalone

## Overview

isucon14とほぼ同じ環境を構築するためのVagrantfileです。

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
  ./bench run . run --addr 127.0.0.1:443 --target https://isuride.xiv.isucon.net --payment-url http://127.0.0.1:12346 --payment-bind-port 12346
  ```

## 動作確認

macOS(intel) + VirtualBox 7.1.4 + Vagrant 2.4.2で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* コンテスト実施時のインスタンスタイプはc5.large(2vCPU, 4GBメモリー)が3台構成です

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### プログラムの動かし方がわからない

以下をご確認ください。

* [ISUCON14 レギュレーション](https://isucon.net/archives/58657116.html)
* [ISUCON14 当日マニュアル](https://gist.github.com/wtks/0a3268de13856ed6e18c6560023ec436)
* [ISUCON14 アプリケーションマニュアル](https://gist.github.com/wtks/8eadf471daf7cb59942de02273ce7884)
* [ISUCON14 リポジトリ](https://github.com/isucon/isucon14)

### ブラウザで動作確認ができない

手元のPCのhostsファイルに以下を追記してください。

```
${サーバのIPアドレス} isuride.xiv.isucon.net
```

追記したらブラウザから `https://isuride.xiv.isucon.net/` にアクセスしてみてください。
アクセスすると証明書エラーが発生する可能性があります。強制的に受け入れるか、証明書は `/etc/nginx/tls/` 配下にあるので手元の証明書ストアに登録することで回避できるはずです。

### Vagrantがない環境で試したい

[isucon/isucon14](https://github.com/isucon/isucon14)の `provisioning/ansible` をご利用ください。

## Related

* [ISUCON](https://isucon.net/)
* [isucon/isucon14](https://github.com/isucon/isucon14)

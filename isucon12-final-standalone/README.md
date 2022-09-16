# vagrant-isucon/isucon12-final-standalone

## Overview

isucon12本選とほぼ同じ環境を構築するためのVagrantfileです。

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
  export ISUXBENCH_TARGET=127.0.0.1
  ./bin/benchmarker --stage=prod --request-timeout=10s --initialize-request-timeout=60s
  ```

## 動作確認

macOS + VirtualBox 6.1.38 + Vagrant 2.3.0で動作確認済です。
VMWare Desktopでも動作するかもしれませんが未確認です。

## 本来の設定と異なるところ

* 本来のサーバはCPU 2コア、メモリ4GBの5台構成です

## FAQ

[トップのFAQ](../README.md#FAQ)も合わせてご確認ください

### ベンチマークを回すとinitalizeでエラーになる

```
22:12:10.213976 [INITIALIZATION_ERR] prepare: timeout: initialize-error-invalid-req: timeout: Post "http://127.0.0.1/initialize": context deadline exceeded
22:12:10.213998 続行不可能なエラーが検出されたので、ここで処理を終了します。
22:12:10.214021 [PASSED]: false
22:12:10.214027 [SCORE] 0 (addition: 0, deduction: 0)
```

initialize時に初期データの流し込みが行われますが、Virtualboxのディスク性能の問題で60秒以内に完了していない可能性があります。
MySQLのチューニングを行うか、ベンチマーク実行時の `--initialize-request-timeout` の秒数を引き伸ばしてみてください。

### プログラムの動かし方がわからない

以下をご確認ください。

- [ISUCON12本選問題](https://github.com/isucon/isucon12-final)

### Vagrantがない環境で試したい

[isucon/isucon12-final](https://github.com/isucon/isucon12-final)をご利用ください。

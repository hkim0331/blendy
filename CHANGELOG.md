# blendy
2021 情報リテラシー授業用デモプログラム。
イメージ A からイメージ B へ変化する gif アニメの下絵を作る。

Windows スタイルの「単一のアプリで全部済ます」から、
Linux スタイルの「小さいコマンドを組み合わせて作業を進める」
の具体例を見せる。

プログラムの内容はわからないはず。わからなくていい。
プログラミングに興味をもつ学生の心をかき立てられれば十分。

github あたりに公開する。

## Unrelease

## 0.2.1 - 2021-07-29
### Changed
- blendy.rkt get-px, put-px! イメージを第一引数に取るように変更。
- ./ を使わず、sh でスクリプトを呼び出す。

## - 2021-07-19
### Changed
- exe とシェルスクリプトを ~/bin にインストールで。README.md を書き換える。

## 0.2.0 - 2021-07-18
### Changed
- README.md さらに改良。

## 0.1.4 - 2021-07-18
- run.sh 追加。

## 0.1.3 - 2021-07-18
### Changed
- README.md 改善。

## 0.1.2 - 2021-07-18
### Added
- ファイルが見つからない時、アラート出して終了。

```sh
$ racket blendy.rkt a b
error: did not find a.
  context...:
   body of "/Users/hkim/projects/blendy/src/blendy.rkt"
```

## 0.1.1 - 2021-07-17
### Added
- コマンドライン解析。手抜き。

## 0.1.0 - 2021-07-16
### Started
- project started. ひとまずサンプルが動く。

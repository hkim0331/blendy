# blendy
2021 情報リテラシー授業用デモプログラム。
イメージ A -> イメージ B へ変化する gif アニメの下絵を作る。

github あたりに公開し、プログラミングに興味をもつ学生の心をかき立てる。

プログラムの内容はわからなくていい、わからないはず。

Windows スタイルの「単一のアプリで全部済ます」から、Linux スタイルの
「小さいコマンドを組み合わせて作業を進める、コマンドが足りなかったら自分で作る」
の具体例を見せる。

## Under Construction
来週の水曜日までに！
最近、こんなのばっかだな。

## Unrelease

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
# blendy

2021 情報リテラシー授業用デモプログラム。

blendy from.png to.png で、
from.png と to.png とをピクセルごとにで移動平均(?)した
00.png ~ 09.png を作る。

OpenCV/Clojure でプログラム作成したいところだが、
開発機の m1-mac と本番機の intel-ubuntu とで
OpenCV ライブラリのバージョンを合わせるのは面倒。

なので、OpenCV 使わない作戦に出る。
racket/draw でやっつけよう。
一部の学生に `racket 勉強してみろ` 焚き付けているので好適。
blendy.rkt はコメント入れても 100 行足らずのショートプログラム。

## usage

サイズの同じスタートイメージ start.png とエンドイメージ end.png を用意して、

```sh
  $ blendy start.png end.png
```
で、10 ステップの 00.png ~ 09.png を作るので、あとは gifsicle 等で gif アニメにする。

* スタートイメージ、エンドイメージは png フォーマットでなくてもよい。gif でも、jpg でも。

* 10 ステップ以外が希望の時は次のように。

```sh
  $ blendy 20 start.jpg end.jpg
```

## note

処理速度無視の単純３重ループ。RGB 分解もループと考えると４重だな。
ま、遅いです。

## build

blendy.rkt のあるフォルダに移動し、
racket インタプリタで以下のように呼び出す。

```
  $ racket blendy.rkt from.png to.png
```

~/bin 等に置いておくスタンドアロンのコマンドがほしい場合は、
raco exe でビルドする。

```sh
  $ raco exe blendy.rkt
  $ mv blendy ~/bin
```

こうすると、作業ディレクトリがどこであっても blendy を起動できるようになる。

ビルドした blendy は起動のために racket インタプリタを必要としない。
racket をインストールしてない隣人に blendy だけコピーしてあげれば、
その隣人は自分の ubuntu で blendy を起動できるようになる。
intel-linux であれば ubuntu じゃなくても起動できる（と思う、未確認）。

## demo

images/フォルダに cat.png、virus.png 置いてある。
いずれも mac の絵文字をキャプチャしたもの。
ターミナルで以下のようにコマンドを実行すると
cat.png から virus.png へモルフィングする anime.gif を自動作成し、
ubuntu のブラウザ firefox でそれを開く。

```sh
$ rm -f *.gif
$ racket blendy.rkt ../images/cat.png ../images/virus.png
$ ./png-to-gif.sh
$ gifsicle --colors 256 -l10 *.gif -o anime.gif
$ firefox anime.gif
```
png-to-gif.sh の中身は、、、ファイル開いて読んでみよう。

run.sh は上の操作をファイルに記録したもの。

```sh
$ ./run.sh
```

で、何回でも繰り返せる。

もしくは、次の１行で。

```sh
$ make clean all
```

## Legal

コピーフリーです。

Copyright © 2021 hkimura

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
$ racket blendy.rkt start.png end.png
```
で、10 ステップの 00.png ~ 09.png を作るので、あとは gifsicle 等で gif アニメにする。

* KISS (Keep It Simple, Stupid) の精神にのっとり、中間ファイルを作ることだけに専念する。

* スタートイメージ、エンドイメージは png 以外、gif でも、jpg でも OK とする。

* 10 ステップ以外、例えば 20 ステップ行きたい時は、

```sh
$ racket blendy.rkt 20 start.jpg end.jpg
```

## note

処理速度無視の単純３重ループ。RGB 分解もループと考えると４重だな。
ま、遅いです。

## build

racket には racket インタプリタを必要とせず、スタンドアロンで実行できるオブジェクトを
生成する機能がある。リテラシーのレベルではこの文章を理解するのは無理だよね。言い換えよう。

racket インタプリタを持たない人に、blendy をコピーしてプレゼントするにはこうする。

作業ディレクトリを src に合わせて、

```sh
$ raco exe blendy.rkt
```

出来上がる blendy (拡張子 .rkt がなくなっていることに注意）
は racket をインストールしていない ubuntu でも起動できる。
racket をインストールしてない隣人に blendy だけコピーしてあげれば、
その隣人は自分の ubuntu で blendy を起動できるようになる。

## path を通す

```sh
$ cp blendy ~/bin
$ source ~/.profile
```

こうすると、作業ディレクトリがどこであっても blendy を起動できるようになる。
cp や source は一度実行すればよく、
ubuntu をリブートしてもその効果は持続します。

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

上の操作を run0.sh にコピーしよう（$ は剥ぎ取る必要あり）。

```sh
$ ./run0.sh
```

で、何回でも繰り返せる。

run0.sh は cat.png と virus.png を決め打ちで入力にしているのを、
ターミナルからコマンドを打つときに指定できるように変更しよう。run.sh です。
どこがどう変わったかをチェックしよう。

... と書いても見ないやついるからな。出来上がり run.sh をコピペします。

```sh
#!/bin/sh
# usage:
# $ ./run.sh im1 im2 out
# example:
# $ ./run.sh dog.png bird.png anime.gif

rm -f *.gif
racket blendy.rkt $1 $2
./png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o $3
firefox $3
```

作ったプログラムを飲み込んださらに便利なプログラムを作ってみた。


## Legal

コピーフリーです。

Copyright © 2021 hkimura

# blendy

2021 情報リテラシー授業用デモプログラム。

Windows スタイルの「単一のアプリで全部済ます」から、Linux スタイルの
「小さいコマンドを組み合わせて作業を進める、コマンドが足りなかったら自分で作る」
の具体例を見せる。

「Scheme の手習い」読んでる学生の励みになるよう、
racket/draw でやっつける。プログラムの内容はわからなくていい。わからないはず。

## usage

サイズの同じスタートイメージ start.png とエンドイメージ end.png を用意して、

```sh
$ racket blendy.rkt start.png end.png
```
で、10 ステップの 00.png ~ 09.png を作る。

* KISS (Keep It Simple, Stupid) の精神にのっとり、
  blendy.rkt は中間ファイルを作ることだけに専念する。

* スタートイメージ、エンドイメージは gif, png, jpg でも OK とする。

* 10 ステップ以外、例えば 20 ステップ行きたい時は次のように。

```sh
$ racket blendy.rkt 20 start.jpg end.jpg
```

## build

### warning - 2021-07-26

raco exe 単独ではスタンドアロンのアプリを作成できない。

```sh
$ raco distribute dir app.exe
```
を実行後、dir に作成される
dir/app/app と dir/lib/racket3m-version を適切なパスに配置する必要がある。
ほんとか？
ほんとだったら、raco exe でスタンドアロンアプリを作成できるってのは嘘。
看板に偽りあり！

### must be rewritten

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

moodle に置いたのはこれです。

## path を通す

* ~/bin というフォルダを作り、
* その中に、blendy と png-to-gif.sh をコピーする。
* ubuntu が ~/bin 中の blendy と png-to-gif.sh を発見できるようにする。

```sh
$ mkdir ~/bin
$ cp blendy png-to-gif.sh ~/bin
$ source ~/.profile
```

こうすると、作業ディレクトリがどこであっても
blendy や png-to-gif.sh を起動できるようになる。
mkdir や cp, source は一度実行すればよく、
ubuntu をリブートしても効果は持続します。

## demo

images/フォルダに cat.png、virus.png 置いてある。
いずれも mac の絵文字をキャプチャしたもの。

ターミナルで以下のようにコマンドを実行すると
cat.png から virus.png へモルフィングする anime.gif を自動作成し、
ubuntu のブラウザ firefox でそれを開く。

```sh
$ rm -f *.gif
$ blendy ../images/cat.png ../images/virus.png
$ png-to-gif.sh
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
ターミナルからコマンドを打つときに指定できるように変更しよう。blendy.sh です。
どこがどう変わったかをチェックしよう。

... と書いても見ないやついるからな。出来上がり run.sh をコピペします。

```sh
#!/bin/sh
# usage:
# $ ./blandy.sh im1 im2 out
# example:
# $ ./blendy.sh dog.png bird.png anime.gif

rm -f *.gif
blendy $1 $2
png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o $3
firefox $3
```

作ったプログラムを飲み込んだ、さらに便利なプログラムを作ってみた。

## Legal

コピーフリーです。

Copyright © 2021 hkimura

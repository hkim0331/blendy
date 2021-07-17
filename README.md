# blendy

2021 情報リテラシー授業用デモプログラム。
イメージA -> イメージB へ変化する gif アニメの下絵を作る。

opencv/clojure で書きたいところだが、
開発機の m1-mac と本番機の intel-ubuntu とで
opencv のライブラリのバージョンを合わせるのは面倒だろう。

なので、opencv 使わない作戦に出る。racket/draw でやっつける。

blendy A.png B.png で、A.pngとB.png を bit by bit で移動平均(?)した
00.gif, 01.gif, ... 09.gif を作る。

## usage

サイズの同じスタートイメージ start.png とエンドイメージ end.png を用意して、

  $ blendy start.png end.png

で、10ステップの 00.gif ~ 09.gif を作るので、あとは gifsicle 等で gif アニメにする。

* スタートイメージ、エンドイメージは png フォーマットでなくてもよい。gif でも、jpg でも。

* 10 ステップ以外が希望の時は、

  $ blendy -20 start.jpg end.jpg

のように。

## note

処理速度無視の単純３重ループです。
RGB 分解もループと考えると４重だな。
ま、遅いです。

## build

  $ raco exe blendy.rkt
  $ mv blendy ~/bin

## run

  $ blendy images/virus.png images/white.png
  $ gifsicle *.gif -o go-away.gif

gifsicle は別途インストールするんだぞ。(apt get install gifsicle)

## Legal

コピーフリーです。

Copyright © 2021 hkimura



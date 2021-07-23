#!/bin/sh
# ターミナルで順に実行すべき複数のコマンドを書き連ねただけのプログラム。
# 上矢印作戦もいいけど、こっちの方が確実で効率的。
# でも、一度はかならずタイプしなくちゃだ。
# きちんと動いたことを確認し、コピペするのだよ。
# 完成一歩前のスクリプトなので、名前も blendy-0.sh のようにする。
# これは hkimura 流。

rm -f *.gif
racket blendy.rkt ../images/cat.png ../images/virus.png
./png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o anime.gif
firefox anime.gif

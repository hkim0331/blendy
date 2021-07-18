#!/bin/sh
# 作業ディレクトリのすべての *.png ファイルを GIF フォーマットに変換する。
# GIF イメージのファイル名はオリジナルの .png を .gif に代えたものとする。

for i in *.png; do
  convert $i `basename $i .png`.gif
done

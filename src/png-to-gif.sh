#!/bin/sh
# 作業ディレクトリのすべての *.png ファイルを GIF フォーマットに変換する。
# GIF イメージのファイル名はオリジナルのファイル名の .png を .gif に代えたものとする。

for i in *.png; do
  convert $i `basename $i .png`.gif
done

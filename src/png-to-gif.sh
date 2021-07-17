#!/bin/sh
for i in *.png; do
convert $i `basename $i .png`.gif
done

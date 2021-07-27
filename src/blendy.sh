#!/bin/sh
# usage:
# $ blendy.sh im1 im2 out
# example:
# $ blendy.sh dog.png bird.png anime.gif

convert $1 -resize '240x240!' left.png
convert $2 -resize '240x240!' right.png
rm -f *.gif
blendy left.png right.png
rm left.png right.png
png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o $3
firefox $3

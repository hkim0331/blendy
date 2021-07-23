#!/bin/sh
# usage:
# $ blendy.sh im1 im2 out
# example:
# $ blendy.sh dog.png bird.png anime.gif

rm -f *.gif
racket blendy.rkt $1 $2
png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o $3
firefox $3
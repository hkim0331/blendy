#!/bin/sh
rm -f *.gif
racket blendy.rkt ../images/cat.png ../images/virus.png
./png-to-gif.sh
gifsicle --colors 256 -l3 *.gif -o anime.gif
firefox anime.gif
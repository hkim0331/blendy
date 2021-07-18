all: test

test:
	racket blendy.rkt ../images/cat.png ../images/virus.png
	./png-to-gif.sh
	gifsicle --colors 256 -l3 *.gif -o anime.gif

exe:
	raco exe blendy.rkt

clean:
	${RM} *.png *.gif *~

realclean:
	make clean
	${RM} blendy

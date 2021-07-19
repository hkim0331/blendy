all: install

test:
	racket blendy.rkt ../images/cat.png ../images/virus.png
	./png-to-gif.sh
	gifsicle --colors 256 -l3 *.gif -o anime.gif

blendy: blendy.rkt
	raco exe blendy.rkt

install: blendy
	cp blendy blendy.sh png-to-gif.sh ~/bin

clean:
	${RM} *.png *.gif *~

realclean:
	make clean
	${RM} blendy

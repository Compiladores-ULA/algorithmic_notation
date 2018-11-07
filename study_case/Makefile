all: fle

eje: a.out
	./a.out < in.txt > out.txt
	
eje2: a.out
	./a.out < in2.txt > out2.txt


lex.yy.c: lex.l
	flex lex.l

fle: lex.yy.c 
	g++ lex.yy.c -lfl

clean:
	rm lex.yy.c out.txt a.out

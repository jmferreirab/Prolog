hombre('juan').
hombre('pablo').
hombre('edwin').
hombre('john').
hombre('eric').
hombre('joshua').

mujer('laura').
mujer('maria').
mujer('lia').
mujer('sam').
mujer('mel').
mujer('janna').

padre('eric','joshua').
padre('john','joshua').

padre('mel','janna').
padre('sam','janna').

padre('juan','maria').
padre('lina','maria').

padre('edwin', 'pablo').

padre('pablo','juan').
padre('pablo','marcela').
padre('pablo','laura').

padre('laura','lia').


primo(A,B) :- tio(X,A), hijo(B,X).

sobrino(A,B) :- tio(B,A).

suegro(A,B) :- pareja(X,B), padre(A,X).

feliz(A) :- pareja(A,_).

cunado(A,B) :- hermano(B,X), pareja(X,A).
cunado(A,B) :- hermano(A,X), pareja(X,B). 

nieto(A,B) :- abuelo(B,A).

bisabuelo(A,B) :- hijo(B,X), abuelo(A,X).

bisnieto(A,B) :- bisabuelo(B,A).

hijo(A,B) :- padre(B,A).

tio(A,B) :- padre(X,B),hermano(X,A).

pareja(A,B) :- hijo(C,A) , hijo(C,B),	A \== B.

abuelo(A,B) :- padre(A,C), padre(C,B).

hermano(A,B) :- padre(C,A), padre(C,B), A \== B.

adoptado(A,B) :- hijo(A,B), pareja(B,X), hombre(B), hombre(X).
adoptado(A,B) :- hijo(A,B), pareja(B,X), mujer(B), mujer(X).
adoptado(A)   :- hijo(A,X), pareja(X,Y), mujer(X),mujer(Y),  X\==Y.
adoptado(A)   :- hijo(A,X), pareja(X,Y), hombre(X),hombre(Y),	X\==Y.

familiar(A,B) :- padre(A,B).
familiar(A,B) :- sobrino(A,B).
familiar(A,B) :- suegro(A,B).
familiar(A,B) :- cunado(A,B).
familiar(A,B) :- hijo(A,B).
familiar(A,B) :- abuelo(A,B).
familiar(A,B) :- bisnieto(A,B).
familiar(A,B) :- bisabuelo(A,B).
familiar(A,B) :- abuelo(A,B).
familiar(A,B) :- nieto(A,B).
familiar(A,B) :- pareja(A,B).
familiar(A,B) :- primo(A,B).
familiar(A,B) :- tio(A,B).
familiar(A,B) :- hermano(A,B).
familiar(A,B) :- cunado(A,B).



hombre('juan').
hombre('araragi').

mujer('senjougahara').
mujer('shinobu').
mujer('hanekawa').

soltero('senjougahara').
soltero('shinobu').
soltero('hanekawa').
soltero('juan').
soltero('araragi').

personalidad('senjougahara', 'introvertida').
personalidad('senjougahara', 'relajada').
personalidad('senjougahara', 'impulsiva').
personalidad('araragi', 'extrovertida').
personalidad('araragi', 'alegre').
personalidad('araragi', 'impulsiva').
personalidad('hanekawa', 'dulce').
personalidad('hanekawa', 'extrovertida').
personalidad('shinobu', 'generosa').
personalidad('shinobu', 'extrovertida').

comidaPref('senjougahara','sushi').
comidaPref('araragi','sushi').
comidaPref('araragi','ramen').
comidaPref('araragi','vino').
comidaPref('hanekawa', 'vino').
comidaPref('shinobu', 'vino').

musicaPref('senjougahara','balada').
musicaPref('araragi','rock').
musicaPref('araragi','balada').
musicaPref('araragi','pop').
musicaPref('shinobu', 'pop').
musicaPref('hanekawa','pop').

temaConversacion('araragi','musica').
temaConversacion('araragi','bebidas').
temaConversacion('araragi','juegos').
temaConversacion('senjougahara','politica').
temaConversacion('senjougahara','musica').
temaConversacion('shinobu', 'bebidas').
temaConversacion('hanekawa', 'juegos').

compatible(A,B) :- comidaPref(A,C), comidaPref(B,C), 
					personalidad(A,E), personalidad(B,E),
					temaConversacion(A,F), temaConversacion(B,F),
					musicaPref(A,G), musicaPref(B,G),
					soltero(A),soltero(B),
					generoCompatible(A,B)
					A\==B.

generoCompatible(A,B) :- hombre(A), mujer(B), A\==B.
generoCompatible(A,B) :- mujer(A), hombre(B), A\==B.
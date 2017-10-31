%Descripcion de profesores
profesor(nombre('Pablo'), tipoContrato('TCO'), status('Asistente')).
profesor(nombre('Melissa'), tipoContrato('TCO'), status('Asistente')).
profesor(nombre('Ped'), tipoContrato('HC'), status('Asistente')).
profesor(nombre('Cindy'), tipoContrato('HC'), status('Asistente')).
profesor(nombre('Maria'), tipoContrato('HCH'), status('Asistente')).
profesor(nombre('Mario'), tipoContrato('MTO'), status('Asistente')).
profesor(nombre('Natalia'), tipoContrato('PLANTA'), status('Asistente')).
profesor(nombre('Pablo'), tipoContrato('TCO'), status('Titular')).
profesor(nombre('Cindy'), tipoContrato('HC'), status('Titular')).

%Pago base hora segun contrato y status
baseHora(tipoContrato('TCO'), status('Titular'), 10000).
baseHora(tipoContrato('HC'), status('Titular'), 12000).
baseHora(tipoContrato('HCH'), status('Titular'), 15000).
baseHora(tipoContrato('MTO'), status('Titular'), 10000).
baseHora(tipoContrato('PLANTA'), status('Titular'), 8000).
baseHora(tipoContrato('TCO'), status('Asistente'), 9000).
baseHora(tipoContrato('HC'), status('Asistente'), 10800).
baseHora(tipoContrato('HCH'), status('Asistente'), 14500).
baseHora(tipoContrato('MTO'), status('Asistente'), 9000).
baseHora(tipoContrato('PLANTA'), status('Asistente'), 7200).

%Horas semanalas segun tipo de contrato
horasContrato(tipoContrato('TCO'),35).
horasContrato(tipoContrato('HC'),16).
horasContrato(tipoContrato('HCH'),20).
horasContrato(tipoContrato('MTO'),22).
horasContrato(tipoContrato('PLANTA'),40).

bonoContrato(0.15, tipoContrato('TCO')).
bonoContrato(0.20, tipoContrato('HC')).
bonoContrato(0.25, tipoContrato('HCH')).
bonoContrato(0.10, tipoContrato('MTO')).
bonoContrato(0.08, tipoContrato('PLANTA')).

%Semanas segun tipo de semestre
tipoSemestre('Normal',16).
tipoSemestre('Intersemestral',4).

%Calculo de la nomina por semestre
nominaSemestre(profesor(nombre(X), Y, Z), Semestre, Total) :- profesor(nombre(X),Y,Z),
															baseHora(Y, Z, B), 
															bonoContrato(Bono, Y), 
															tipoSemestre(Semestre,S), 
															horasContrato(Y, H), 
															Total is round((B*H*S)*(1+Bono)).
																											
%ejemplo de consulta:    nominaSemestre( X, 'Normal', Total).
%ejemplo de consulta:    nominaSemestre( profesor(nombre('Melissa'), _, _), 'Normal', Total).

totalSemestre(Tipo, Valor) :- listaNominas(Lista, Tipo),  sum_list(Lista, Valor).
											  
											  
listaNominas(Lista, Tipo) :- findall( Valor, nominaSemestre(profesor(nombre(_),_,_), Tipo, Valor), Lista ).
												
											  
sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.

count(Thing, N) :-
    count(Thing, [], 0, N).

count(Thing, Seen, Acc, N) :-
    profesor(nombre(X),Y,Z),
    (   member(X, Seen)  ->  fail    ;   !,
        nominaSemestre(profesor(nombre(X),Y,Z),'Normal',Valor),
		Acc1 is Acc + Valor,
        count(Thing, [X|Seen], Acc1, N)
    ).
	
count(_, _, N, N).

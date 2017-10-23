%Descripcion de profesores
profesor(nombre('Melissa'), tipoContrato('TCO'), status('Asistente')).

%Pago base segun contrato y status
baseHora(tipoContrato('TCO'), status('Asistente'), 10000).
baseHora(tipoContrato('HC'), status('Asistente'), 1500).

%Horas semanalas segun tipo de contrato
horasContrato(tipoContrato('TCO'),35).
horasContrato(tipoContrato('HC'),16).
horasContrato(tipoContrato('HCH'),20).
horasContrato(tipoContrato('MTO'),22).
horasContrato(tipoContrato('PLANTA'),40).

bonoContrato(0.15, tipoContrato('TCO')).

%Semanas segun tipo de semestre
tipoSemestre('Normal',16).
tipoSemestre('Intersemestral',4).

%Calculo de la nomina por semestre
nominaSemestre(profesor(nombre(X), Y, Z), Semestre, Total) :- baseHora(Y, Z, B), 
															bonoContrato(Bono, Y), 
															tipoSemestre(Semestre,S), 
															horasContrato(Y, H), 
															Total is round((B*H*S)*(1+Bono)).

%ejemplo de consulta:    nominaSemestre( profesor(nombre('Melissa'), Y, Z), 'Normal', Total).
%ejemplo de consulta:    nominaSemestre( profesor(nombre('Melissa'), _, _), 'Normal', Total).

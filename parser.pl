/* Analisis de palabras */

/*Funcion miembro de una lista.*/
miembro(B, [X| _]):- B = X.
miembro(B, [_|Y]):- miembro(B, Y).

/* Analiza si en una oracion existe coincidencia con la base de datos.*/
queComer([], Output):- false.
queComer([P|Oracion], Output):-
    miembro(P, restaurante(X)),
    queComer(Oracion, Output).

/* Prueba */
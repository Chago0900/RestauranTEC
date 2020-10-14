:- ensure_loaded(restaurantes).

/* Analisis de palabras */

/* Analiza si en una oracion existe coincidencia con la base de datos.*/

frase_usuario(X) :-
    X = [],
    write("Ninguna palabra coincide con las del diccionario."),
    false.
frase_usuario([W|_]) :-
    restaurante(R),
    identifier(W, R).
frase_usuario([_|P]) :-
    frase_usuario(P).

identifier(N, [X|_]) :-
    N = X,
    write(N),
    write(" se encuentra en el diccionario").
identifier(N, [_|Y]) :-
    identifier(N, Y).

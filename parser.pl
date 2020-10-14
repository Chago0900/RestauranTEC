:- ensure_loaded(restaurantes).

/* Analisis de palabras */

/* Analiza si en una oracion existe coincidencia con la base de datos.*/

frase_usuario(X, N) :-
    X = [],
    write("Ninguna palabra coincide con las del diccionario."),
    false.
frase_usuario([W|_], W) :-
    restaurante(R),
    identifier(W, R).
frase_usuario([_|P], W) :-
    frase_usuario(P, W).

identifier(N, [X|_]) :-
    N = X.

identifier(N, [_|Y]) :-
    identifier(N, Y).

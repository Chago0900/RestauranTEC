:- ensure_loaded(restaurantes).

/* Analisis de palabras */
/* Analiza si en una oracion existe coincidencia con la base de datos.*/

/* ***** Funcion miembro */
miembro(B, [X| _]):- B = X.
miembro(B, [_|Y]):- miembro(B, Y).

/* ***** Funcion eliminar */
eliminar(A, [A|B], B).
eliminar(A, [B, C|D], [B|E]) :-
    eliminar(A, [C|D], E).

/*
**Descripción:** recibe la oración que redacta el usuario y la analiza para encontrar coincidencias con la base de datos.

**Parámetros:** 
- X: lista de palabras generada a partir de la oración que digita el usuario.
- N: variable que almacena una lista con las palabras que tienen coincidencia en la base de datos.*/
frase_usuario(X, N) :-
    X = [],
    write("Ninguna palabra coincide con las del diccionario."),
    false.

frase_usuario([W|_], W) :-
    restaurante(R),
    atom_string(W, S),
    identifier(S, R).

frase_usuario([_|P], W) :-
    frase_usuario(P, W).

/* Funcion miembro.
*/
identifier(N, [X|_]) :-
    N = X.

identifier(N, [_|Y]) :-
    identifier(N, Y).

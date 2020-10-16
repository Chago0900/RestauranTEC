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
    miembro(S, R).

frase_usuario([_|P], W) :-
    frase_usuario(P, W).


/*
 **Descripción:** recibe la oración que redacta el usuario y cuenta la cantidad de veces que se repite en la base de datos.

 **Parámetros:**
 - X: lista de palabras generada a partir de la oración que digita el usuario.
 - L: lista de que contiene los elemento de la base de datos.
 - C: contador de la cantidad de veces que se ha repetido una palabra de la lista X en la lista L, siempre debe empezar en 0.
*/

repetitions(X, L, C) :-
    L = [],
    write("Recorrido de lista finalizado"), nl,
    write("cantidad de repeticiones:  "),
    write(C).
repetitions(X, L, C) :-
    repetitions_aux(X, L, C, X).

repetitions_aux(X, [J|K], C, Temp) :-
    Temp = [],
    repetitions(X, K, C).
repetitions_aux(X, [J|K], C, [H|_]) :-
    miembro(H, J),
    R is C + 1,
    repetitions(X, K, R).
repetitions_aux(X, L, C, [_|T]) :-
    repetitions_aux(X, L, C, T).
    
    


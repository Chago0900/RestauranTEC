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
**Descripción:** recibe la oración que redacta el usuario 
y la analiza para encontrar coincidencias con la base 
de datos.

**Parámetros:** 
- X: lista de palabras generada a partir de la oración que digita el usuario.
- N: variable la palabra que tiene coincidencia en la base de datos.*/
frase_usuario([W|_], W) :-
    restaurante(R),
    atom_string(W, S),
    miembro(S, R).

frase_usuario([_|P], W) :-
    frase_usuario(P, W).

frase_usuario(X, N) :-
    X = [],
    write("Lo siento :(  pero no tenemos coincidencias para ti."), nl,
    false.

/*
 **Descripción:** recibe la oración que redacta el usuario y 
 cuenta la cantidad de veces que se repite en la base de datos.
 **Parámetros:**
 - X: lista de palabras generada a partir de la oración que digita el usuario.
 - L: lista de que contiene los elemento de la base de datos.
 - C: contador de la cantidad de veces que se ha repetido una palabra de la lista X en la lista L.
*/
repetitions(X, C) :-
    findall(Y,restaurante(Y),L),
    repetitions(X, L, C).

repetitions(X, L, C) :-
    repetitions_aux(X, L, 0, X, S),
    C = S.

repetitions_aux(X, L, C, Temp, S) :-
    L = [],
    C = S.
repetitions_aux(X, [_|K], C, Temp, S) :-
    Temp = [],
    repetitions_aux(X, K, C, X, S).
repetitions_aux(X, [J|K], C, [H|_], S) :-
    miembro(H, J),
    R is C + 1,
    repetitions_aux(X, K, R, X, S).
repetitions_aux(X, L, C, [_|T], S) :-
    repetitions_aux(X, L, C, T, S).
    
/*
 **Descripción:** recibe la oración que redacta el usuario y retorna el restaurante que tenga alguna palabra de la oración en su base de datos.

**Parámetros:**
 - X: lista de palabras generada a partir de la oración que digita el usuario.
 - L: lista de que contiene los elemento de la base de datos.
 - R: valor de retorno que contiene una lista con la informacion del restaurante.
*/
get_restaurante(X, R) :-
    findall(Y,restaurante(Y),L),
    get_restaurante(X, L, R).

get_restaurante(X, L, R) :-
    get_restaurante_aux(X, L, S, X),
    R = S.

get_restaurante_aux(X, [_|K], S, Temp) :-
    Temp = [],
    get_restaurante_aux(X, K, S, X).
get_restaurante_aux(X, [J|_], S, [H|_]) :-
    miembro(H, J),
    S = J.
get_restaurante_aux(X, L, S, [_|T]) :-
    get_restaurante_aux(X, L, S, T).


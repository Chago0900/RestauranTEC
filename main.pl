:- ensure_loaded(parser).
 /*
 **Descripción:** asocia los valores de la base de datos de restaurantes a un tipo y una pregunta para responder en la interfaz.

**Parámetros:** 
- valor: string de la base de datos.
- tipo: indica el tipo de valor que representa.
- pregunta: respuesta del sistema experta para el usuario de modo que la conversación continúe.
*/
tipoValor("italiano", estilo, "¿Algún plato en particular?").
tipoValor("rápida", estilo, "¿Algún plato en particular?").
tipoValor("italiana", estilo, "¿Algún plato en particular?").

tipoValor("pizza", menu, "¿Qué sabor de pizza?").
tipoValor("calzone", menu, "¿Qué te gustaría de tomar?").
tipoValor("espaguetti", menu, "¿Qué te gustaría de tomar?").
tipoValor("hamburguesa", menu, "¿Qué te gustaría de tomar?").
tipoValor("tacos", menu, "¿Qué te gustaría de tomar?").
tipoValor("papas", menu, "¿Qué te gustaría de tomar?").

tipoValor("jamon", variante, "¿Qué te gustaría de tomar?").
tipoValor("suprema", variante, "¿Qué te gustaría de tomar?").
tipoValor("hawaina", variante, "¿Qué te gustaría de tomar?").
tipoValor("pepperoni", variante, "¿Qué te gustaría de tomar?").

tipoValor("vino", bebida, "¿En qué zona?").
tipoValor("fanta", bebida, "¿En qué zona?").
tipoValor("coca", bebida, "¿En qué zona?").
tipoValor("cerveza", bebida, "¿En qué zona?").

tipoValor(A, 1, "Terminamos"):- restauranteFinal(A).

tipoValor("Italia", nombre).
tipoValor("Italianísimo", nombre).
tipoValor("McBurguesa", nombre).

tipoValor("San Pedro", ubicacion).
tipoValor("Alajuela", ubicacion).
tipoValor("Cartago", ubicacion).


preguntas(["¿Qué te gustaría comer?",
          "¿Algún plato en particular?",
          "¿Qué te gustaría de tomar?",
          "¿En qué zona?"]).


/*writeNextQuestion([], Coincidencia, false).

writeNextQuestion([P|Preguntas], Coincidencia, false):-
    write(P),
    read(X),
    split_string(S, "_", "\s", L),
    frase_usuario(L, N),
    tipoValor(N, B, Y),
    writeNextQuestion(NuevasPreguntas, Y, miembro(Y, NuevasPreguntas)).

writeNextQuestion(Preguntas, Coincidencia, true):-
    nl, write(Coincidencia), nl,
    eliminar(Coincidencia, Preguntas, NuevasPreguntas).
    

writeNextQuestion:-
    preguntas(T),
    writeNextQuestion(T,"¿Qué te gustaría comer?", true ),
    read(Oracion), nl,
    split_string(Oracion, "_", "", L),
    frase_usuario(L, N),
    tipoValor(N, B, Y),
    writeNextQuestion(NuevasPreguntas, Y, miembro(Y, NuevasPreguntas)).*/

restauranteFinal(Coincidencia):-
    findall(Y,restaurante(Y),L),
    restauranteFinal(Coincidencia, L).

restauranteFinal(Coincidencia, [L|B]):-
    restauranteFinal(Coincidencia, B),
    miembro(Coincidencia, L),
    respuesta(L).

respuesta([L|_]):-
    write("Nuestra sugerencia es: "),
    write(L).


/*
**Descripción:** representa el main del programa. Se encarga de generar la conversación y ser un mediador entre el usuario y la lógica.

**Parámetros:** ninguno.*/
restauranTEC:-
    write("¡Hola! Espero que te encuentres súper bien"), nl,
    write("¿Qué te gustaría comer?"), nl,
    read(X), nl,
    split_string(X, "_", "", L),
    frase_usuario(L, N),
    tipoValor(N, B, Y),
    write(Y),
    read(I),
    split_string(I, "_", "", L2),
    frase_usuario(L2, N2),
    tipoValor(N2, 1, Y2),
    write(Y2).
    
   



 

:- ensure_loaded(parser).


tipoValor(A, B, 1, "Gracias por usar RestauranTEC, ¡Lindo dia!"):- 
    get_restaurante([A], [R|_]), 
    tipoValor(R, B, C),
    write("Te sugerimos que vayas a: "),
    write(R), nl,
    write("Direccion: "), write(B), nl,
    write(C), nl, 
    write("Gracias por usar RestauranTEC, ¡Lindo dia!"), nl,
    halt.


tipoValor(A, B, C, Y):- tipoValor(A, B, Y).




 /*
 **Descripción:** asocia los valores de la base de datos de 
 restaurantes a un tipo y una pregunta para responder en la 
 interfaz.
**Parámetros:** 
- valor: string de la base de datos.
- tipo: indica el tipo de valor que representa.
- pregunta: respuesta del sistema experta para el usuario de 
modo que la conversación continúe.
*/
tipoValor("italiano", estilo,  "¿Algún plato en particular?").
tipoValor("rápida", estilo, "¿Algún plato en particular?").
tipoValor("italiana", estilo,  "¿Algún plato en particular?").

tipoValor("pizza", menu,   "¿Qué sabor de pizza?").
tipoValor("calzone", menu, "¿Qué te gustaría de tomar?").
tipoValor("espaguetti", menu,  "¿Qué te gustaría de tomar?").
tipoValor("hamburguesa", menu, "¿Qué te gustaría de tomar?").
tipoValor("tacos", menu,  "¿Qué te gustaría de tomar?").
tipoValor("papas", menu, "¿Qué te gustaría de tomar?").
tipoValor("sandwich", menu, "¿Qué te gustaría de tomar?").
tipoValor("sub", menu, "¿Qué te gustaría de tomar?").
tipoValor("sopa", menu, "¿Qué te gustaría de tomar?").
tipoValor("nachos", menu, "¿Qué te gustaría de tomar?").
tipoValor("carne", menu, "¿Qué te gustaría de tomar?").

tipoValor("jamon", variante,  "¿Qué te gustaría de tomar?").
tipoValor("suprema", variante, "¿Qué te gustaría de tomar?").
tipoValor("hawaina", variante,  "¿Qué te gustaría de tomar?").
tipoValor("pepperoni", variante,  "¿Qué te gustaría de tomar?").

tipoValor("vino", bebida,  "¿En qué zona?").
tipoValor("fanta", bebida,  "¿En qué zona?").
tipoValor("coca", bebida,   "¿En qué zona?").
tipoValor("cerveza", bebida,  "¿En qué zona?").
tipoValor("cafe", bebida,  "¿En qué zona?").
tipoValor("pepsi", bebida,  "¿En qué zona?").
tipoValor("cervezas", bebida,  "¿En qué zona?").

tipoValor("San Pedro", ubicacion, "Que lindo").
tipoValor("Alajuela", ubicacion, "Que lindo").
tipoValor("Cartago", ubicacion, "Que lindo").
tipoValor("Curridabat", ubicacion, "Que lindo").
tipoValor("Chepe", ubicacion, "Que lindo").
tipoValor("Escazu", ubicacion, "Que lindo").

tipoValor("Bella Italia", "Curridabat", "300m Sur de la entrada principal de la Universidad de Costa Rica").
tipoValor("Italianísimo", "Alajuela", "50m Sur de la entrada Banco de Costa Rica").
tipoValor("McBurguesa", "Cartago", "100m Norte de la entrada principal del TEC").
tipoValor("Burger Fantasy", "Escazu", "200m Este de Zareto.").
tipoValor("NachosCR", "Chepe", "200m Este del museo de los niños.").
tipoValor("Subs","Curridabat", "200m Norte de Plaza Freses.").




/*
**Descripción:** representa el main del programa. 
Se encarga de generar la conversación y ser un 
mediador entre el usuario y la lógica.
**Parámetros:** ninguno.*/
restauranTEC:-
    write("¡Hola! Espero que te encuentres súper bien"), nl,
    write("¿Qué te gustaría comer?"), nl,
    read_input.


/*
**Descripción:** Es lo que podríamos llamar un "hecho recursivo". 
Consiste en el ciclo del programa. Se llama continuamente, desplegando 
preguntas y recibiendo respuestas hasta encontrar una coincidencia.
**Parámetros:** Ninguno.
*/
read_input :-
    repeat,
    read_string(user_input, "\n", "\r\t ", _, Line),
    process_input(Line).

process_input(Line) :-
    string(Line),
    split_string(Line, " ", " ", L),
    frase_usuario(L, Coincidencia),
    repetitions(L, Cont), nl,
    tipoValor(Coincidencia, B, Cont, SiguientePregunta),
    write(SiguientePregunta), nl,
    read_input.


 

:- ensure_loaded(parser).


tipoValor("italiano", estilo, "¿Algún plato en particular?").
tipoValor("Comida Rápida", estilo, "¿Algún plato en particular?").
tipoValor("italiana", estilo, "¿Algún plato en particular?").

tipoValor("Pizza", menu, "¿Qué sabor de pizza?").
tipoValor("Calzone", menu, "¿Qué te gustaría de tomar?").
tipoValor("Espaguetti", menu, "¿Qué te gustaría de tomar?").
tipoValor("Hamburguesa", menu, "¿Qué te gustaría de tomar?").
tipoValor("Tacos", menu, "¿Qué te gustaría de tomar?").
tipoValor("Papas", menu, "¿Qué te gustaría de tomar?").

tipoValor("Jamon y queso", variante, "¿Qué te gustaría de tomar?").
tipoValor("Suprema", variante, "¿Qué te gustaría de tomar?").
tipoValor("Hawaina", variante, "¿Qué te gustaría de tomar?").
tipoValor("Pepperoni", variante, "¿Qué te gustaría de tomar?").

tipoValor("vino", bebida, "¿En qué zona?").
tipoValor("fanta", bebida, "¿En qué zona?").
tipoValor("coca", bebida, "¿En qué zona?").
tipoValor("cerveza", bebida, "¿En qué zona?").

tipoValor("Bella Italia", nombre).
tipoValor("Italianísimo", nombre).
tipoValor("McBurguesa", nombre).

tipoValor("San Pedro", ubicacion).
tipoValor("Alajuela", ubicacion).
tipoValor("Cartago", ubicacion).


restauranTEC:-
    write("¡Hola! Espero que te encuentres súper bien"), nl,
    write("¿Qué te gustaría comer?"), nl,
    read(X), nl,
    split_string(X, "_", "", L),
    frase_usuario(L, N),
    tipoValor(N, B, Y),
    write(Y).

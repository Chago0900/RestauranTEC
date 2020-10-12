/* restaurante(nombre, orientacion, menu, direccion, capacidad) 
nombre: string
orientacion: string
menu: lista compuesta del plato seguido de las variaciones
direccion: lista compuesta del lugar seguido de la direccion exacta
capacidad: int*/

restaurante(["Bella Italia", 
            "italiano", 
            ["Pizza", ["Jamon y queso", "Suprema", "Hawaina"], "Calzone", [], "Espaguetti", []], 
            ["San Pedro", "300m Sur de la entrada principal de la Universidad de Costa Rica"], 
            10]).

restaurante(["Italianísimo", 
            "italiano", 
            ["Pizza", ["Pepperoni"], "Calzone", [], "Espaguetti", []], 
            ["Alajuela", "50m Sur de la entrada Banco de Costa Rica"], 
            50]).

restaurante(["McBurguesa", 
            "Comida Rápida", 
            ["Hamburguesa", [], "Tacos", [], "Papas", []], 
            ["Cartago", "100m Norte de la entrada principal del TEC"], 
            20]).
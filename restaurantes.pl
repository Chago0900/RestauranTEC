/* restaurante(nombre, orientacion, menu, direccion, capacidad) 
nombre: string
orientacion: string
menu: lista compuesta del plato seguido de las variaciones
direccion: lista compuesta del lugar seguido de la direccion exacta
capacidad: int*/

restaurante(["Bella Italia", 
            "italiano", 
            "pizza", "jamon", "queso", "suprema", "hawaina", "calzone", "espaguetti",
            "vino", "fanta", 
            "Curridabat", "300m Sur de la entrada principal de la Universidad de Costa Rica", 
            "Solo se permiten burbujas y durante la espera se debe utilizar mascarilla.",
            10]).

restaurante(["Italianísimo", 
            "italiano", 
            "pizza", "pepperoni", "calzone", "espaguetti",
            "coca", "cervezas", 
            "alajuela", "50m Sur de la entrada Banco de Costa Rica", 
            "Utilizar mascarilla.",
            50]).

restaurante(["McBurguesa", 
            "rapida", 
            "hamburguesa", "tacos",  "papas", 
            "coca", "fanta",
            "Cartago", "100m Norte de la entrada principal del TEC",
            "Sólo se permiten burbujas.", 
            20]).

restaurante(["BurgerFantasy", 
            "rapida", 
            "hamburguesa", "nachos",  "papas", 
            "coca", "fanta",
            "Escazu", "200m Este de Zareto.",
            "Sólo se permiten burbujas sociales.", 
            40]).

restaurante(["NachosCR", 
            "mexicana", 
            "nachos", "carne",  "tacos", 
            "coca",
            "chepe", "200m Este del museo de los niños.",
            "Lleva alcohol en gel.", 
            30]).

restaurante(["Subs", 
            "sandwich", 
            "sub", "sopa", 
            "cafe", "pepsi",
            "curridabat", "200m Norte de Plaza Freses.",
            "Recuerde su mascarilla y careta.", 
            25]).
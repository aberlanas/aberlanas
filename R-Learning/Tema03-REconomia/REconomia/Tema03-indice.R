# Load packages 
library(tidyverse) 
library(gapminder) # este paquete contiene los datos que vamos a emplear
library(ggthemes) # este paquete tiene temas gráficos (plantillas)
library(ggrepel) # este paquete evita que las etiquetas se superpongan en los gráficos

datos_brutos <- gapminder::gapminder

# comprobamos las variables y la dimensión

colnames(datos_brutos) # con nombre de columnas (colnames)

dim(datos_brutos)

head(datos_brutos)


# seleccionamos los datos de 2007, creando un nuevo data.frame

# sin usar ningún paquete especial solo considerando el data.frame como una
# estructura matricial, extraemos las filas en que el año sea 2007 y todas las columnas
datos_para_2007_tradicional <- datos_brutos[datos_brutos$year == 2007,]


# con los corchetes le estamos indicando que parte del data.frame queremos empleando las dos dimensiones del objeto  [filas,columnas]

# Por tanto la instrucción  indica de datos_brutos vamos a obtener las filas en las que datos_brutos$year sea igual a 2007 y todas las columnas por eso en los corchetes hemos indicado [datos_brutos$year == 2007,]

head(datos_para_2007_tradicional)


# una forma alternativa, con el mismo resultado, empleando la notación del tidyverse:

# seleccionamos los datos de 2007, creando un nuevo data.frame
datos_para_2007 <- datos_brutos %>% 
  filter(year == 2007)


# lo que acabamos de hacer es crear un objeto denominado datos_para_2007 que parte de datos brutos y filtra, elige, sólo aquellos con la variable year igual a 2007.

# comprobamos los nuevos datos
head(datos_para_2007)


# como se puede apreciar el resultado es el mismo


# con summary podemos ver un pequeño resumen de datos_para_2007
# para las variables de tipo factor summary muestra el número de observaciones mientras que para las variables numéricas proporciona algunos estadísticos de la distribución de la variable

summary(datos_para_2007)


# ggplot trabaja de forma secuencial, por capas
# indicamos al fuente de datos y asignamos variables 'x' e 'y'
# todos el código para construir gráficos empieza siempre por ggplot
# indicando la fuente de datos, que será un dataframe, indicando la variable
# 'x' así como la variable 'y'

# es una estructura de este tipo:
# ggplot(data =    , aes(x =     , y =     ))

# aes( ) hace referencia a aesthetics.

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp))

# indicamos el tipo de grafico, en este caso geom_point(), siempre empieza por geom_
ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

#incluimos color por continentes

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp,color = continent)) +
  geom_point()

# cambiamos el nombre de los ejes
ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point() +
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') # labs es abreviacion de labels (etiquetas)


# añadimos un tema de formato
ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_few()

# añadimos un tema de formato
ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_dark()

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_economist() # hemos variado este tema

# con theme() damos formato específico a los elementos del gráfico

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_economist() +
  theme(axis.text = element_text(size = 14), # hacer referencia al texto de los ejes
        axis.title = element_text(size = 14, face = 'bold'))# hace referencia a los títulos de los ejes)

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size = 3) + # modificamos el tamaño del punto
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20))) # movemos la posición de los títulos del eje


# en aes() vamos a diferenciar los continentes por forma (shape) en lugar de por color

ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, shape = continent)) +
  geom_point(size = 3) + 
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))


ggplot(data = datos_para_2007, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point(size = 3)+
  facet_wrap(facets = ~ continent, ncol = 2)+ # los paneles o facets se construyen por continente y colocamos dos columnas de paneles
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  # theme se usa para dar formato especifico a los elementos del grafico
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))


datos_europa_2007 <- datos_para_2007 %>% 
  filter(continent == 'Europe')

# vamos a usar ahora el paquete ggrepel dentro de ggplot. ggrepel permite incluir texto de identificación de los puntos y evita que el texto se solape (se repele)

# si hemos incluido al principio del script library(ggrepel) entonces no lo tenemos que volver a hacer

# si usamos varias capas geom es preferible situar aes() en la función ggplot, así indicamos que las varibles son las mismas para todas las capas geom

ggplot(data = datos_europa_2007, aes(x = gdpPercap, y = lifeExp, label = country))+
  geom_point(size = 3)+
  geom_text_repel() + # la etiqueta de los puntos se obtiene de la variable 'country'
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  # theme se usa para dar formato especifico a los elementos del grafico
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))


# para asignarle un nombre, como siempre ponemos el nombre que le vamos a dar y luego <-  al hacer esto ya no aparecerá el gráfico en la ventana de gráficos de RStudio como había pasado hasta ahora.

pib_vida_europa <- ggplot(data = datos_europa_2007, aes(x = gdpPercap, y = lifeExp, label = country))+
  geom_point(size = 3)+
  geom_text_repel()+ # la etiqueta de los puntos se obtiene de la variable 'country'
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  # theme se usa para dar formato especifico a los elementos del grafico
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))

ggsave(filename = 'pib vida europa.png', plot = pib_vida_europa, device = 'png', units = 'cm', width = 15, height = 12)  

# una vez introducimos ggsave y el primer paréntesis con el tabulador podemos ver las opciones de la función. En este caso hemos optado por exportar el gráfico a un archivo png, con dimensiones 10 x 8 cm. Si no especificamos las unidades entonces la función empleará pulgadas.

# Al exportar si hemos fijado un tamaño de figura demasiado pequeño es posible que el tamaño de letra de títulos y ejes sea demasiado grande. En ese caso habrá que modificar el código para reducir el tamaño de los textos o modificar las dimensiones de la figura en ggsave.


# si queremos exportar a pdf la estructura es la misma
ggsave(filename = 'pib vida europa.pdf', plot = pib_vida_europa, device = 'pdf', units = 'cm', width = 15, height = 12) 

# si queremos guardar el archivo en otra carpeta distinta la función tiene un parámetro denominado path que nos permite especificar otra carpeta diferente a la que estamos empleando.


# filtramos los países Europeos a partir de datos_brutos

datos_europa <- datos_brutos %>% 
  filter(continent == 'Europe')

# podemos coger parte del código empleado anteriormente y transformarlo
# ahora los datos son otros pero el codigo es similar
# cambiamos geom_point() por geom_line()

ggplot(data = datos_europa, aes(x = year, y = gdpPercap))+
  geom_line()+
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold'))


# si añadimos color dentro de la primera instruccion estamos indicando que queremos agrupar (y colorear los objetos) por la variable que escribamos, en este caso country

ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line()+
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))

# si añadimos geom_point() tendremos ambos tipos de figuras

ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line()+
  geom_point()+
  labs(x = 'Año', y = 'PIB per capita ($)')+
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))

ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line()+
  geom_point()+
  facet_wrap(facets = ~ country, ncol = 5) + # facets en función de country estructurado en 5 columnas
  labs(x = 'PIB per capita ($)', y = 'Expectativa de vida (años)')+
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))

ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line()+
  geom_point()+
  facet_wrap(facets = ~ country, ncol = 5) +
  labs(x = 'Año', y = 'PIB per capita ($)')+
  theme_economist()+ 
  theme(
    axis.text.x = element_text(size = 13, angle = 45), # angulos de las etiquetas del eje x
    axis.text.y = element_text(size = 9), # fijamos de forma independiente el texto de los ejes x e y. Aquí le reducimos el tamaño al texto del eje y
    axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)),
    strip.text = element_text(size = 9), # cada titulo de cada uno de los paneles del grafico, facets, es una band o strip y sus características tambień son modificables, en este caso le fijamos el tamaño de letra
    legend.position = 'none') # para suprimir la leyenda

# le asignamos un nombre de grafico en R, por ejemplo, pib_europa
pib_europa <- ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country)) +
  geom_line() +
  geom_point() +
  facet_wrap(facets = ~ country, ncol = 5) +
  labs(x = 'Año', y = 'PIB per capita ($)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 10), # modificando el tamaño de letra
        axis.text.x = element_text(angle = 45), # angulos de las etiquetas del eje x
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)),
        strip.text = element_text(size = 9),
        legend.position = 'none') # para suprimir la leyenda

ggsave(filename = 'evolucion pib europa.pdf', plot = pib_europa, device = 'pdf',  width = 19, height = 27, units = 'cm') # podremos encontrar el archivo generado en la misma carpeta en que esté guardado el script que estamos empleando o en la carpeta del proyecto (si hemos creado un proyecto al empezar a trabajar)


ggplot(data = datos_europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line() +
  geom_point() +
  facet_wrap(facets = ~ country, ncol = 4) + # modificamos el número de columnas
  labs(x = 'Año', y = 'PIB per capita ($)') +
  theme_economist()+ 
  theme(axis.text = element_text(size = 10), # modificando el tamaño de letra
        axis.text.x = element_text(angle = 45), # angulos de las etiquetas del eje x
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)),
        strip.text = element_text(size = 9),
        legend.position = 'none') +
  scale_y_continuous(labels = function(x) format(x, big.mark = ".", scientific = FALSE))


# con scale_y_continuous(labels = comma) aparecería la coma para separar los miles


# de nuevo lo podemos exportar a pdf 

ggsave('evolucion pib europa con 4 columnas.pdf', width = 19, height = 27, units = 'cm') # podremos encontrar el archivo generado en la misma carpeta en que esté guardado el script que estamos empleando o en la carpeta del proyecto (si hemos creado un proyecto)


# vamos a elegir los 5 con el mayor PIB en el último año disponible
# necesitamos crear una variable nueva para obtener el PIB multiplicando la población (pop) por el PIB per capita


# mediante la notación tidyverse
Europa_top_5 <- datos_brutos %>% 
  filter(continent == 'Europe') %>% 
  filter(year == max(year)) %>% 
  mutate(PIB = pop * gdpPercap) %>% # mutate crea nuevas variables
  arrange(desc(PIB)) %>%  # arrange ordena pero hay que emplear desc() para cambiar el orden a descendente, por defecto es ascendente
  top_n(5) # con top_n elegimos las n, en este caso 5, primeras

# observa que en R el símbolo = es para asignar un valor a una variable mientras que == es empleado para comparar. En las líneas anteriores empleamos ambos.


# podemos visualizar el objeto creado mediante

head(Europa_top_5)

# o mediente

glimpse(Europa_top_5)


# mediante R básico, podemos hacer lo mismo, pero es un poco más complicado.

# Veamos como...

Europa_top_5 <- datos_brutos[datos_brutos$continent == 'Europe' & datos_brutos$year == max(datos_brutos$year),] # formato matricial [filas, columnas] elegimos las filas en las que el continente es Europa y el año el más alto.

Europa_top_5$PIB <-  Europa_top_5$pop * Europa_top_5$gdpPercap

Europa_top_5 <- Europa_top_5[order(desc(Europa_top_5$PIB)),]

Europa_top_5 <- head(Europa_top_5, 5)

# también podemos ver el dataframe mediante
View(Europa_top_5) # que nos lo muestra en otra pestaña


paises_a_elegir <- Europa_top_5$country

datos_5_Europa <- datos_brutos %>% 
  filter(country %in% paises_a_elegir)


ggplot(data = datos_5_Europa, aes(x = year, y = gdpPercap, color = country))+
  geom_line() +
  geom_point() +
  labs(x = 'Año', y = 'PIB per capita ($)') +
  scale_y_continuous(labels = function(x) format(x, big.mark = ".", scientific = FALSE)) +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 14, face = 'bold'))


# creamos un data.frame filtrando datos_brutos y dejando sólo el año 2007
paises_en_2007 <- datos_brutos %>% 
  filter(year == 2007)

# al igual que antes comenzamos con ggplot y ahora la función geom es geom_bar

ggplot(data = paises_en_2007, aes(x = continent)) +
  geom_bar()


ggplot(data = paises_en_2007, aes(x = continent, fill = continent)) +
  geom_bar() +  # fill indica la variable para colorear las barras
  labs(x = 'Continente', y = 'Número de países') +
  theme_few() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold'),
        legend.position = 'none')


pib_2007 <- datos_brutos %>% 
  filter(year == 2007)

ggplot(data = pib_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_boxplot() +
  labs(x = 'Continente', y = 'PIB per capita ($)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold'),
        legend.position = 'top',
        legend.text = element_text(size = 14))


ggplot(data = pib_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_boxplot() +
  labs(x = 'Continente', y = 'PIB per capita ($)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',  margin = margin(t = 20, r = 20)),
        legend.position = 'top',
        legend.text = element_text(size = 14))


ggplot(data = pib_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_violin() +
  labs(x = 'Continente', y = 'PIB per capita ($)') +
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',  margin = margin(t = 20, r = 20)),
        legend.position = 'top',
        legend.text = element_text(size = 14))

ggplot(data = pib_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_violin() +
  geom_point() +
  labs(x = 'Continente', y = 'PIB per capita ($)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',  margin = margin(t = 20, r = 20)),
        legend.position = 'top',
        legend.text = element_text(size = 14))

ggplot(data = pib_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_violin() +
  geom_jitter(width = 0.2) + 
  labs(x = 'Continente', y = 'PIB per capita ($)') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',   margin = margin(t = 20, r = 20)),
        legend.position = 'none', # de este modo podemos suprimir la leyenda
        legend.text = element_text(size = 14))

# partimos del grafico anterior modificando el geom y asignando la variable x a gdpPercap

ggplot(data = pib_2007, aes (x = gdpPercap, fill = continent)) +
  geom_histogram() +
  labs(x = 'PIB per capita (€)', y = 'Frecuencia') +
  theme_economist() + 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',   margin = margin(t = 20, r = 20)),
        legend.position = 'top',
        legend.text = element_text(size = 14))

# partimos del grafico anterior modificando el geom y asignando la variable x a gdpPercap

ggplot(data = pib_2007, aes(x = gdpPercap)) +
  geom_histogram() +
  labs(x = 'PIB per capita (€)', y = 'Frecuencia') +
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 18, face = 'bold',   margin = margin(t = 20, r = 20)),
        legend.position = 'top',
        legend.text = element_text(size = 14))

ggplot(data = pib_2007, aes (x = gdpPercap, fill = continent)) +
  geom_histogram(color = 'white') + # así indicamos que el borde es blanco
  facet_wrap(~continent, ncol = 1, scales = 'free_y') + # con free_y dejamos que la escala del eje Y varíe entre histogramas, si no lo indicamos la escala de todos los ejes Y de los 5 histogramas será la misma
  labs(x = 'PIB per capita ($)', y = 'Frecuencia')+
  theme_economist()+
  theme(axis.text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, vjust = 0.5),
        axis.title = element_text(size = 14, face = 'bold',  margin = margin(t = 20, r = 20)),
        legend.position = 'none',
        legend.text = element_text(size = 14))


# Load packages 
library(tidyverse) 
library(gapminder) # este paquete contiene los datos que vamos a emplear
library(ggthemes) # este paquete tiene temas gráficos (plantillas)
library(ggrepel) # este paquete evita que las etiquetas se superpongan en los gráficos


datos_brutos <- gapminder_unfiltered # son todos los datos del paquete gapminder sin filtrar

# podemos comprobar las dimensiones del data.frame

dim(datos_brutos)

# así como las variables que contiene

colnames(datos_brutos)

# ejemplo de filter:
pib_capita_continente_2007 <- datos_brutos %>% 
  filter(year == 2007) # asi se seleccionan todos los datos de datos_brutos cuyo año es 2007 y se introducen en el objeto pib_capita_continente_2007


head(pib_capita_continente_2007)

# calculo del PIB de cada pais
pib_capita_continente_2007 <- datos_brutos %>% 
  filter(year == 2007) %>% # empleamos == para indicar comparación
  mutate(PIB = gdpPercap * pop) # mutate crea una nueva variable pib per capita x población. Se emplea = para asignar un valor a la variable PIB

head(pib_capita_continente_2007)


# se agrupa por continente y se obtiene el número de observaciones de cada grupo, la suma del PIB, la suma de la población y el PIB per capita para cada continente
pib_capita_continente_2007 <- datos_brutos %>% 
  filter(year == 2007) %>% 
  mutate(PIB = gdpPercap * pop) %>% 
  group_by(continent) %>% 
  summarise(n = n(), PIB = sum(PIB) , poblacion = sum(as.numeric(pop)), PIB_capita = PIB/poblacion)

head(pib_capita_continente_2007)

# selección de las columnas continente y PIB per capita
pib_capita_continente_2007 <- datos_brutos %>% 
  filter(year == 2007) %>% 
  mutate(PIB = gdpPercap * pop) %>% 
  group_by(continent) %>% 
  summarise(n = n(), 
            PIB = sum(PIB) , 
            poblacion = sum(as.numeric(pop)), 
            PIB_capita = PIB/poblacion) %>% 
  select(continent, PIB_capita)


head(pib_capita_continente_2007)


# selección de las columnas continente y PIB per capita
pib_capita_continente_2007 <- datos_brutos %>% 
  filter(year == 2007) %>% 
  mutate(PIB = gdpPercap * pop) %>% 
  group_by(continent) %>% 
  summarise(n = n(), 
            PIB = sum(PIB) , 
            poblacion = sum(as.numeric(pop)), 
            PIB_capita = PIB/poblacion) %>% 
  select(continent, PIB_capita) %>% 
  filter(continent != 'FSU') # el operador != significa "distinto", por tanto filtramos por continente distinto a 'FSU'


head(pib_capita_continente_2007)


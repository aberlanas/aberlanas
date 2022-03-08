# Tema 03-Ejercicio 3-3

library(tidyverse) # Instalacion de tidyverse
library(gapminder) # este paquete contiene los datos que vamos a emplear
library(ggthemes) # este paquete tiene temas gráficos (plantillas)
library(ggrepel) # este paquete evita que las etiquetas se superpongan en los gráficos
library(stringr) # paquete para extraer caracteres

# esta es la dirección obtenida de la referida web, la asignamos a la variable direccion_internet_ipc y la colocamos entre comillas. 

direccion_internet_ipc <- 'https://www.bde.es/webbde/es/estadis/infoest/series/be2623.csv'

# Si leemos el archivo csv a partir de la dirección:

datos_inflacion <- read.csv(file = direccion_internet_ipc, header = FALSE, skip = 6, na.strings = '_') 
num_filas <- nrow(datos_inflacion)
datos_inflacion <- datos_inflacion[1: (num_filas -2), ] 


# podemos ver los nombres de las columnas 

datos_inflacion$V1 <- as.character(datos_inflacion$V1)
meses <- unique(str_sub(datos_inflacion$V1, start = 1, end = 3))
meses_con_punto <- paste0(meses, '.')



#datos_inflacion$V1 <- str_replace_all(string = datos_inflacion$V1, 
#                                      pattern = meses, 
#                                      replacement = meses_con_punto)

datos_inflacion$V1 <- paste0('01 ',datos_inflacion$V1)
datos_inflacion$V1 <- as.Date(datos_inflacion$V1, '%d %b %Y')

                              
inflacion_ESP <- datos_inflacion %>% 
  select(V1, V3, V4) %>% 
  rename(Fecha = V1, IPC_UE = V3,  IPC = V4)                             

datos_inflacion$V1 <- paste0('01 ',datos_inflacion$V1) # le pegamos el día 01, primer día del mes
head(datos_inflacion)

                              
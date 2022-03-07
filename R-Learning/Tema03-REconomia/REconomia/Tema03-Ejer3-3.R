# Tema 03-Ejercicio 3-3

library(stringr) # paquete para extraer caracteres

# esta es la dirección obtenida de la referida web, la asignamos a la variable direccion_internet_ipc y la colocamos entre comillas. 

direccion_internet_ipc <- 'https://www.bde.es/webbde/es/estadis/infoest/series/be2623.csv'

# Si leemos el archivo csv a partir de la dirección:

datos_inflacion <- read.csv(file = direccion_internet_ipc, header = FALSE, skip = 6, na.strings = '_') # leemos el csv de la dirección de internet, sin considerar cabecera, evitando las 6 primeras filas, y cuando aparezca el guion bajo se considerará NA, no disponible (Not Available)

# En este caso los datos tienen algo de informacion adicional, no numérica en las dos últimas filas. La inclusión de dicha información no es una buena prácticas desde el punto de vista de la gestión de datos. Así que deberemos eliminar dichas dos filas

num_filas <- nrow(datos_inflacion) # asi podemos ver el numero de filas que tiene el dataframe

datos_inflacion <- datos_inflacion[1: (num_filas -2), ] #así estamos cogiendo todas la filas menos las dos últimas y todas las columnas. Es notación matricial que sigue el formato OBJETO[filas, columnas]. Al dejar vacío tras la coma, quiere decir que se cogen todas las columnas

# podemos ver los nombres de las columnas 

datos_inflacion$V1 <- as.character(datos_inflacion$V1)

meses <- unique(str_sub(datos_inflacion$V1, start = 1, end = 3))

datos_inflacion$V1 <- str_replace_all(string = datos_inflacion$V1, 
                                      pattern = meses, 
                                      replacement = meses_con_punto)

datos_inflacion$V1 <- paste0('01 ',datos_inflacion$V1) # le pegamos el día 01, primer día del mes

datos_inflacion$V1 <- as.Date(datos_inflacion$V1, '%d %b %Y') # le estamos indicando que queremos que la variable V1 sea de tipo fecha y que está en formato día %d, mes abreviado %b y años con las cuatro cifras %Y


# Vamos a elegir la columna 4, la correspondiente a España, la columna 1, la que indica la fecha así como la columna 3 la correspondiente a la UE, zona Euro, y a renombrar mediante rename

inflacion_ESP <- datos_inflacion %>% 
  select(V1, V3, V4) %>% 
  rename(Fecha = V1, IPC_UE = V3,  IPC = V4)


# Vamos a transformar la variable V1 en carácter para poder manipularla

datos_inflacion$V1 <- as.character(datos_inflacion$V1)

datos_inflacion$V1 <- as.Date(datos_inflacion$V1, '%d %b %Y') # le estamos indicando que queremos que la variable V1 sea de tipo fecha y que está en formato día %d, mes abreviado %b y años con las cuatro cifras %Y

datos_inflacion$V1 <- paste0('01 ',datos_inflacion$V1) # le pegamos el día 01, primer día del mes
head(datos_inflacion)

# Vamos a elegir la columna 4, la correspondiente a España, la columna 1, la que indica la fecha así como la columna 3 la correspondiente a la UE y a renombrar mediante rename

inflacion_ESP <- datos_inflacion %>% 
  select(V1, V3, V4) %>% 
  rename(Fecha = V1, IPC_UE = V3,  IPC = V4)

head(inflacion_ESP)


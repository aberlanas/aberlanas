# Tarea 4.1 - Introduccion


library(openxlsx) # para importar y exportar hojas de cálculo en formato xlsx


datos_valencia <- read.xlsx('datos_valencia.xlsx')

head(datos_valencia)

datos_valencia_alquiler_anual <- datos_valencia %>% 
  mutate(precio = if_else(condition = tipo == 'alquiler', true = precio * 12, false = precio))

valores_medios <- datos_valencia_alquiler_anual %>% 
  group_by(tipo) %>% 
  summarise(numero_observaciones = n(), 
            precio_medio = mean(precio),
            minimo = min(precio),
            maximo = max(precio))

valores_medios
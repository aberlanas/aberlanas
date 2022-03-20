# Tarea 4.2 - Introduccion


library(openxlsx) # para importar y exportar hojas de cálculo en formato xlsx

datos_valencia <- read.xlsx('datos_valencia.xlsx')

datos_valencia_alquiler_anual <- datos_valencia %>% 
  mutate(precio = if_else(condition = tipo == 'alquiler', true = precio * 12, false = precio))

datos_valencia_alquiler_anual$precio_unitario <- datos_valencia_alquiler_anual$precio / datos_valencia_alquiler_anual$superficie


valores_medios_distritos <- datos_valencia_alquiler_anual %>% 
  group_by(tipo, distrito) %>% 
  summarise(numero_observaciones = n(), 
            precio_medio_unitario = mean(precio_unitario), 
            mediana = median(precio_unitario))

valores_medios_distritos <- valores_medios_distritos %>% 
 arrange(desc(precio_medio_unitario))

valores_medios_distritos


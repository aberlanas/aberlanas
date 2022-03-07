# Load packages 
library(tidyverse) 
library(gapminder) # este paquete contiene los datos que vamos a emplear
library(ggthemes) # este paquete tiene temas gráficos (plantillas)
library(ggrepel) # este paquete evita que las etiquetas se superpongan en los gráficos

# Obtenemos los datos
datos_brutos <- gapminder::gapminder

datos_tarea_3_2 <- datos_brutos %>% filter(country == "China" | country == "India" | country == "Japan")

# Generamos el grafico
pib_vida_china_india_japan <-ggplot(data = datos_tarea_3_2, aes(x = year, y = gdpPercap, color = country))+
  geom_line() +
  geom_point() +
  facet_wrap(facets = ~ country, ncol = 1) + # modificamos el número de columnas
  labs(x = 'Año', y = 'PIB per capita ($)') +
  theme_economist()+ 
  theme(axis.text = element_text(size = 10), # modificando el tamaño de letra
        axis.text.x = element_text(angle = 45), # angulos de las etiquetas del eje x
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)),
        strip.text = element_text(size = 9),
        legend.position = 'none') +
  scale_y_continuous(labels = function(x) format(x, big.mark = ".", scientific = FALSE))


ggsave(filename = 'pib-vida-asian-top.pdf', plot = pib_vida_china_india_japan, device = 'pdf', units = 'cm', width = 15, height = 12) 

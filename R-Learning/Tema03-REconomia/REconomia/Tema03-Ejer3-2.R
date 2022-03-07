# Obtenemos los datos
datos_brutos <- gapminder::gapminder

datos_tarea_4_2 <- datos_brutos %>% filter(country == "China" | country == "India" | country == "Japan")


ggplot(data = datos_tarea_4_2, aes(x = year, y = gdpPercap, color = country))+
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

# Obtenemos los datos
datos_brutos <- gapminder::gapminder

# Guardamos los datos de Oceania
datos_oceania <- datos_brutos %>% 
  filter(continent == 'Oceania')

# Guardamos el grafico
pib_vida_oceania <- ggplot(data = datos_oceania, aes(x = year, y = gdpPercap, color = country))+
  geom_line()+
  labs(x = 'Año', y = 'PIB per capita ($)')+
  theme_economist()+ 
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14, face = 'bold', margin = margin(t = 20, r = 20)))

# 
ggsave(filename = 'pib-vida-oceania.pdf', plot = pib_vida_oceania, device = 'pdf', units = 'cm', width = 15, height = 12) 

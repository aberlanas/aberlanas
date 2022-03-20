# Instalacion paquetes
#install.packages("gapminder")
#install.packages("xlsx")
#install.packages("openxlsx")
# 
packages <- c("readxl", "gapminder", "openxlsx")
install.packages(setdiff(packages, rownames(installed.packages()))) 

library(openxlsx)
library(gapminder)
library(readxl)

# Cargamos los datos
serie_parados_trimestral_2002_2019 <- read.xlsx("rsrc/serie_parados_trimestral_2002_2019.xlsx")

serie_parados_csv <- read.csv2("rsrc/serie_parados_trimestral_2002_2019.csv")

# Convertir la variable local a global dentro del script
#attach(serie_parados_trimestral_2002_2019)

#serie_parados_trimestral_2002_2019$Trimestre # Variable Local

#cbind(serie_parados_trimestral_2002_2019$Trimestre,serie_parados_trimestral_2002_2019$Parados)[1:2,]

#summary(serie_parados_trimestral_2002_2019)

#View(serie_parados_trimestral_2002_2019)

datos_brutos <- gapminder::gapminder
#summary(datos_brutos)
#write.csv(x=datos_brutos,row.names = TRUE, file="rsrc/datos_brutos.csv")
#write.xlsx(x=datos_brutos,file="rsrc/datos_brutos.xlsx")

# Descriptiva

## Histograma
#hist(datos_brutos$lifeExp)
#summary(datos_brutos$continent)
#boxplot(datos_brutos$lifeExp,horizontal = TRUE)
## Descriptiva de una cuantitativa
#table(datos_brutos$continent)
#pie(table(datos_brutos$continent))
#barplot(table(datos_brutos$continent))

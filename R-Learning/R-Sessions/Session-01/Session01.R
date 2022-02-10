# Algunos calculos de ejemplo

#print(paste("El cos(8) es : ",a))

vector = c(1,1,2,3)

media <- mean(vector)

m1 <- matrix(data = vector, nrow = 2, ncol = 2 ,byrow = TRUE)

print(m1)

factor("1","2","3")

numero = 3

### Definicion de funciones 

media <- function(x){
  valor <- sum(x)/length(x)
  return(valor)
}

media(vector)
media(numero)

###

# Algunos calculos de ejemplo

#print(paste("El cos(8) es : ",a))
vector = c(1,1,2,3)
media <- mean(vector)
m1 <- matrix(data = vector, nrow = 2, ncol = 2 ,byrow = TRUE)
factor("1","2","3")
numero = 3

### Definicion de funciones 

vector = c(1,1,2,3)
numero = 3

media <- function(x){
  valor <- (sum(x)/length(x))
  return(valor)
}

media(vector)
media(numero)

###

poli <- function(x,y,z){
  return( x^2+y^3+z^4)
}

print(poli(3,4,5))

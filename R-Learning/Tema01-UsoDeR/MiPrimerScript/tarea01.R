# Probando R

## Algunas operaciones matematicas
2*3

654/23

log(36)

3^7

## Operaciones Trigonometricas

x<-pi/2
print(x)
cos(x)
sin(x)
tan(x)

y<-90
cos(y*pi/180)
sin(y*pi/180)
tan(y*pi/180)


## Vectores

y <- c(2,5,1,7)
mean(y)
y[3]

## Matrices

a <- matrix(c(1, 1, 1, 2), nrow = 2)
b <- matrix(c(1, 3, 2, 4), ncol = 2)
c <- matrix(c(1,4,2,5,3,6),nrow=3,ncol=2)
c[3,1]
dim(c)

## Funciones

media <- function(x) {
  valor <- sum(x)/length(x)
  return(valor)
}
y <- c(2,5,1,7)
mean(y)

## Operaciones con Vectores

a <- c(3,1,6,8)
b <- c(5.6,2,0,9)
a+b

print(a+b)

print(a-b)

print(a/b)

print(a*b)

print(crossprod(a,b))

print(tcrossprod(a,b))

## Operaciones con Matrices

A <- matrix(c(1,2,3,4),nrow=2,ncol=2)
B <- matrix(c(-1,-2,-3,-4),nrow = 2,ncol = 2)

print(A)

print(B)

#Producto matricial
A %*% B 

#Traspuesta
t(A)

#Inversa
solve(A)


## Ayuda
help(t)

## Paquetes
# install.packages("forecast")

## Resolucion Ecuaciones sencillas

#5x = 10. Encontrar x
solve(5,10)

## Ejemplos mas dificiles
uniroot(function(n) (0.95)^n+ 0.05*n*(0.95)^(n-1)-0.1,
        interval = c(0,100))

## Operaciones con matrices
## para sistemas de ecucaciones
matriz_a <- matrix(c(3,1,2,1),nrow=2,ncol=2)
matriz_b <- matrix(c(8,2),nrow=2,ncol=1)
solve(matriz_a,matriz_b)



# segunda clase -----------------------------------------------------------

length(letters)
?sample
sample(letters)
?set.seed
#siempre cuando vaya a trabajar con funciones que tengan numeros aleatorios 
#fijar el set.sedd
set.seed(1)
sample(letters)

z <- c("1","2")
is.numeric(z)# evaluacion siempre es importante saber que tipo de datos es con los que trabajos
m <- as.numeric(z)#Transformar (logicamente) a vectores o datos en R
m
as.logical(m)
#matrices
x<-sample(1:10)
as.matrix(x)
matrix(x,ncol = 10)
matrix(x,nrow = 10)
matriz <- matrix(x,ncol=10)
mdat <- matrix(c(1:6)/2,nrow =3,ncol = 2,dimnames = list(c(1:3),c("Edad","tamaño")))
mdat
#para matrices y vectores casi siempre utilizar [] 
class(mdat)
typeof(mdat)
Familia<-list("Dario"=c(10:20),"David"=c(5:10))
Familia
Familia["Dario"]#uso de los corchetes en una lista
#uso de $
Familia$Dario[5]
#diferencias entre $ y []
Familia["Dario"]#esto sigue siendo una lista
Familia[["Dario"]]#esto es un vector
Familia$Dario# esto es igual un vector

# Concatenacion -----------------------------------------------------------
#uso del rbin y cbin
nmat <-matrix(c(1:6),ncol=2,nrow = 3)
rbind(nmat,mdat)
cbind(nmat,mdat)
#actividades 
t<-c(1,NA-1L,"C")
class(t)
t<-c(3L,NaN+1L)
t
class(t)
?setNames
setNames(objects= nm , nm)

# EJEMPLOS ----------------------------------------------------------------

usuarios<-sample(c("Dario","David","Oscar","Kevin"),size=100,replace=T)
usuarios
length(usuarios)
meses <- sample(1L:12L, size=100,replace= T)
meses
normales<-rnorm(500)
normales
mean(normales)
sd(normales)
ventas<-rnorm(n=100,mean=100,sd=490)
ventas
egresos<-rnorm(n=100,mean=750,sd=10)
caja<-list(usuarios,meses,ventas,egresos)
caja
attributes(mdat)#siempre importante ver los atributos de los objectos
names(ventas)<-usuarios
ventas["Dario"]

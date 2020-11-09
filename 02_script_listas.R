
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

# objetos s3 --------------------------------------------------------------

sexo<-sample(c("M","f"),600,replace = T)
sexo
table(sexo)#siempre usar table para variables ordinales o categorias
table(usuarios)
table(meses)
#usamos summary para un resumen estadistico 
summary(egresos)
instruccion<-sample(c("primaria ","secundaria","universidad","posgrado"),1000,replace=T                    )
instruccion
table(instruccion)
plot(table(instruccion))
#facvtores 
factor_instruccion<-factor(instruccion)
factor_instruccion
class(factor_instruccion)
typeof(factor_instruccion)
attributes(factor_instruccion)
as.numeric(factor_instruccion)
factor_corregido<-factor(instruccion,levels = c("primaria ","secundaria","universidad","posgrado"))
factor_corregido
resumen_instruccion<-table(factor_corregido)
plot(resumen_instruccion)
#herramienta para sacar intervalos
intervalos_ventas<-cut(ventas,breaks = c(0,20,100,300,1000))
intervalos_ventas     
resumen_ventas<-table(intervalos_ventas)
plot(resumen_ventas)

# Clase 3 FEchas ----------------------------------------------------------
hoy<-Sys.Date()
hoy
class(hoy)
as.numeric(hoy)
hoy_ch<-as.character(hoy)
hoy_ch
fecha<-as.Date("2020-01-05")
fecha
#por defecto es siempre año mes y dia 
fecha<-as.Date("2020/01/05")
fecha

# Formatos de fecha -------------------------------------------------------

fecha<-as.Date("2020/01/05",format= "%Y/%d/%m")#cambio el formato , cualquier cosa hay formatos en goggle
fecha
Sys.getlocale()
fecha<-as.Date("Julio 20 2020" ,format="%B %d %Y")
fecha
help("as.date")
Sys.setlocale("LC_ALL","Spanish_Ecuador")
Sys.getlocale()
#cambiar origen de la fecha y saber que dia va ser 
as.Date(60,origin="2020-01-01")
typeof(fecha)
now_ct<-as.POSIXct("2020-10-5 22:00",tz="UTC" )
now_ct
attributes(now_ct)
typeof(now_ct)
#recordar al momento de trabajar con horas puedo trabajar con posix (segundos),as.date (dias)
#cambiando fechas
structure(now_ct,tzone="Asia/Tokio")
structure(now_ct,tzone="America/New_York")
structure(now_ct,tzone="Europa/Paris")

# DATAFRAMES --------------------------------------------------------------
class(iris)
attributes(iris)
iris
table(iris)
summary(iris)
str(iris)

# subsets con dataframes --------------------------------------------------

iris$Sepal.Length
iris["Sepal.Length"]
a<-iris[,1]
b<-iris[1,]
class(b)
plot(iris)
#columnas
iris[,c("Species","Sepal.Length")]
iris[["Species"]]
iris[,c(2,1,2)]
#parafilas
iris[c(1:15),]
vector<-rnorm(100)
mat<-matrix(vector,ncol = 5,nrow = 20)
mat
mat<-as.data.frame(mat)
#se puede hacer con vetores indipendientes
head(mat,n=21)#primeras obs
tail(mat)#ultima observaciones
#ingresar una columna en un datframe
mat$anio<-sample(1970:2020,20,replace = T)
mat
mes<-sample(1:12,20,replace = T)
dia<-sample(1:30,20,replace=T)
mat$mes<-mes
mat$dia<-dia
mat
fecha_texto<-paste(mat$anio,"-",mat$mes,"-",mat$dia,sep="")
fecha_texto<-as.Date(fecha_texto)
mat$fecha_texto<-fecha_texto
mat
mat$suma<-mat$V1+mat$V2
mat
sort(mat$fecha_texto)#ordenar
orden<-order(mat$fecha_texto)
mat_ord<-mat[orden,]
mat_ord
print(mat_ord)


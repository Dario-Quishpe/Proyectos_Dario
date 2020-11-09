
# Funciones ---------------------------------------------------------------
x<-rnorm(100)
y<-rnorm(100,mean=5,sd=10)
x
y
x+y
x-y
x %*% y #producto escalar
x^2
5 %% 2  
5 %/% 2
5 / 2
#los condicionales no son vectoriales a menos que 
x<0
#nos da una comparacion de cada elemento dek vetor x
x
y
x>y#por preguntar pero parece que si funciona

# subset con condiciones --------------------------------------------------
x[x<=0]

x[x==10]
iris[iris$Species=="setosa",]
indicador<-iris$Species!="setosa"
iris[indicador,]
#combinar condiciones
indicador2<-iris$Sepal.Length>5 & iris$Species=="virginica"
iris[indicador2,]
#for loops 
normales<-list()
for(i in 1:5){
  normales[[i]]<-rnorm(i)
}
normales
str(normales)
attributes(normales)
asistentes<-letters
for(nombre in asistentes){
  saludo<-paste("HOLA: ",nombre)
  print(saludo)
}
z=x+y
z
length(z)
z<-c()
for(i in 1:100){
  z[i]<-x[i]+y[i]
}
z
#ejercicio de los numeros primos en R entre el 1 y el 100
if(1>2|2>5){
  "True"
}else{
  "False"
}
for(i in 100:1){
  print(i)
}

for(i in 2:20){
  flag<-T
    if(i==2){
      sol<-paste(i,":Es primo");
      print(sol)
    }else{
      for(j in i:2){
        if(i%%j==0 & i!=j ){
          flag<-F
          break()
        }
      }
      if(flag==F){
        sol<-paste(i,":No Es primo");
        print(sol)
      }else{
        sol<-paste(i,":Es primo");
        print(sol)
        
      }
      
    }
  
}


# Fibonacci ---------------------------------------------------------------

x<-c()
x[1]=0
x[2]=1
x
for(i in 3:20){
  x[i]<- x[i-1] + x[i-2]
  print(x[i])
}
x

# NOrmalizar matrices -----------------------------------------------------

my.mat<-matrix(NA,nrow = 100,ncol = 20)
for(i in 1:ncol(my.mat)){
  my.mat[,i]<-rpois(100,lambda = i)  
}
my.mat
means<-c()
for(i in 1:ncol(my.mat)){
  means[i]<-mean(my.mat[,i],na.rm = T)#remover valores NA en las columnas , asi puedo usar la funcion media(mean)  
}
sdv<-c()
for(i in 1:ncol(my.mat)){
  sdv[i]<-sd(my.mat[,i],na.rm = T)#remover valores NA en las columnas , asi puedo usar la funcion media(mean)  
}
sdv

means
length(means)
#ejemplo de remover valores Na de un vector 
vector_NA<-c(3,4,1,NA,10,3,NA)-3
mean(vector_NA)
mean(vector_NA,na.rm = T)
table(vector_NA,useNA = "ifany")#cuento el numero de NA que se encuentran en mi vector
summary(vector_NA)
#vamos a operar con filas y con columnas#forma extendida 
centrada<-matrix(NA,nrow = 100,ncol = 20)
for(i in 1:ncol(my.mat)){
centrada[,i]<-(my.mat[,i]-means[i])/sdv[i]  
  
}
View(centrada)
#forma compavta y uso de aplyy
centrada1<-apply(X=my.mat,
                 MARGIN=2,#1 para filas , 2 para columnas y 3 para arrays 
                  FUN = function(x){
                  (x-mean(x,na.rm = T ))/sd(x)  
                  })

centrada1
#forma numero tres de normalizar la matriz
identical(centrada,centrada1)
centrada_2<-scale(my.mat,center=T,scale=T)
centrada_2
View(centrada_2)
#generador de Na (poner aleatoriamente Na en una matriz o data frame )
vector<-rnorm(1000,mean=50,sd=20)
ind_vacios<-sample(1:1000,50)
length(ind_vacios)
vector[ind_vacios]<-NA
vector
summary(vector)
 validacion<-is.na(vector)#bucando los vacios
vector[validacion]<-0 #reemplazando los vacios
vector

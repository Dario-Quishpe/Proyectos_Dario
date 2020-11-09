
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

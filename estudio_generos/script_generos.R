
# #ESTUDIO DE GENEROS -----------------------------------------------------

# Caso de estudio 1:

# Paso 0: Directorios

# Datos:
if(!dir.exists("estudio_generos/datos/")){
  dir.create("estudio_generos/datos/")
}

# Diccionarios:
if(!dir.exists("estudio_generos/diccionarios/")){
  dir.create("estudio_generos/diccionarios/")
}

# Paso 1: 
# Descarga, creación de directorios y descompresión de archivos

# Descarga: 

if(!file.exists("estudio_generos/enemdu_2019_12.zip")){
  
  download.file(url = "https://www.ecuadorencifras.gob.ec/documentos/web-inec/EMPLEO/2019/Diciembre/BDD_ENEMDU_2019_12_CSV%20%28DATOS%20ABIERTOS%29.zip",
                destfile = "estudio_generos/enemdu_2019_12.zip")#reescribo el nombre del documento que se descarga
  
}

# Descompresión:
# Chequeo que tengo dentro del zip:

enemdu_file <- "estudio_generos/enemdu_2019_12.zip"#ruta del archivo zip
enemdu_file

unzip(zipfile = enemdu_file,list = T)#listado de documentos que se encuentran dentro del archivo zip 


# Ahora ya conozco el contenido y necesito:
#    Diccionarios
#    Base de personas

unzip(zipfile = enemdu_file,
      files = c("enemdu_persona_201912.csv",
                "DICCIONARIO_VARIABLES.zip"),#elijo los documentos que me interesan para poder descargarlos 
      exdir = "estudio_generos" )

# Pasar mis datos a la carpeta respectiva:

file.copy(from = "estudio_generos/enemdu_persona_201912.csv",
          to = "estudio_generos/datos/enemdu_persona_201912.csv")#copiar el archivo de un lugar a otro

# Quiero extraer los diccionarios, pues es un aun un archivo zip :

unzip(zipfile = "estudio_generos/DICCIONARIO_VARIABLES.zip",list = T)


unzip(zipfile = "estudio_generos/DICCIONARIO_VARIABLES.zip",
      files = "enemdu_personas_2019_12.xlsx",
      exdir = "estudio_generos/diccionarios")

# elimnar archivos:

file.remove(c("estudio_generos/enemdu_persona_201912.csv",
              "estudio_generos/DICCIONARIO_VARIABLES.zip",
              "estudio_generos/enemdu_2019_12.zip"))#elimino los datos temporales que se usaron para organizar los insumos


# Diccionario(por si las mosacas , es redundante ) -------------------------------------------------------------

if(!file.exists("estudio_generos/diccionario_var.zip")){
  download.file("https://www.ecuadorencifras.gob.ec/documentos/web-inec/EMPLEO/2019/Diciembre/201912_Diccionario_varaibles.zip",
                destfile = "estudio_generos/diccionario_var.zip"
                
  )
  
}


# unzip del diccionario:

unzip("estudio_generos/diccionario_var.zip",list = T)

unzip("estudio_generos/diccionario_var.zip",
      files = "enemdu_personas_2019_12.xlsx",
      exdir = "estudio_generos/diccionarios")

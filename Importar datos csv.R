temperatura <- read.csv("C:/Analisis_Estadistico_2022/Estadística Doctorado 2025
                        /Posgrado_Estadistica_2025/temperatura.csv")
View(temperatura)
head(temperatura) # Muestra las primeras 6 filas de la base de datos en la consola.
dim(temperatura) # Muestra cuantas filas y columnas tiene la base de datos.
names(temperatura) # Muestra cuales son los nombres de los encabezados.
str(temperatura) # Muestra la estructura del data frame.
summary(temperatura) # Resumen estadistico  sencillo de la base de datos
names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", 
                        "Sep", "Oct", "Nov", "Dic")

temperatura$media_anual <- rowMeans(temperatura[,2:13])
head(temperatura)

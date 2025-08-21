# Jorge Ivan Garza Aldape
# 21/08/2025
# 1677695

# Importar datos locales --------------------------------------------------

temperatura <- read.csv("temperatura.csv")
View(temperatura) # Abre el objeto en una pestaña
head(temperatura) # Muestra las primeras 6 filas de la base de datos en la consola.
dim(temperatura) # Muestra cuantas filas y columnas tiene la base de datos.
names(temperatura) # Muestra cuales son los nombres de los encabezados.
str(temperatura) # Muestra la estructura del data frame.
summary(temperatura) # Resumen estadistico  sencillo de la base de datos
names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", 
                        "Sep", "Oct", "Nov", "Dic")

temperatura$media_anual <- round(rowMeans(temperatura[,2:13]),1)
head(temperatura)

colores <- c("blue", "skyblue", "white")

temp <- temperatura[ ,2:13]
temp10 <- temperatura[11:21 , 2:13]

# Crear un boxplot de las medias de temperatura del 2000 al 2020
boxplot(temp, col = colores,
        main = "Medias de temperatura del 2000 al 2020",
        xlab = "Meses", ylab = "Temperatura (°C)")

# Crear un boxplot de las medias de temperatura del 2010 al 2020
boxplot(temp10, col = colores,
        main = "Medias de temperatura del 2010 al 2020",
        xlab = "Meses", ylab = "Temperatura (°C)")

# Importar datos web ------------------------------------------------------

url <- "https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv"

senasica <- read.csv(url, header = T)
View(senasica)
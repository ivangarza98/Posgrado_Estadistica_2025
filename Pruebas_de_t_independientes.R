# Script 6
# 04/09/2025
# Jorge Iván Garza Aldape
# 1677695

# Prueba de t muestras independientes

# Revisar la produccion del kg de semilla para el año 2012 y 2013

produccion <- read.csv("mainproduccion.csv", header = T)
View(produccion)

produccion$Tiempo <- as.factor(produccion$Tiempo)

boxplot(produccion$Kgsem ~ produccion$Tiempo)

# H0 = La media de producción de semilla del año 2013 fué mayor que la del 2012
# (diferente de 0).
# H1 = La media de produccion de semilla del año 2013 es igual que la del 2012 (igual
# a 0).

t2012 <- subset(produccion$Kgsem, produccion$Tiempo == "T2012")
t2013 <- subset(produccion$Kgsem, produccion$Tiempo == "T2013")

t.test(t2012, t2013, alternative = "greater", var.equal = T, paired = T)

# No se rechaza H0.
# Las medias no son significativamente diferentes, por lo tanto las medias de ambos años
# son estadisticamente iguales, es decir, la produccion del año 2013 es estadisticamente
# igual a la del 2012.
# La media de producción del año 2013 fue mayor por 0.78 kg que la del 2012.

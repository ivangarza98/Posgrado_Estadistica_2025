# Script 4
# 28/08/2025
# Jorge Ivan Garza Aldape
# 1677695

# Importar --------------------------------------------------------------

calidad <- read.csv("calidad_plantula.csv", header = T)
View(calidad)

calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad$Tratamiento)
summary(calidad)

mean(calidad$IE)

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

colores <- c("yellow", "blue")
boxplot(calidad$IE~ calidad$Tratamiento, col = colores,
        main = "Efecto del fertilizante sobre plantulas",
        xlab = "Tratamiento", ylab = "Índice de esbeltez")
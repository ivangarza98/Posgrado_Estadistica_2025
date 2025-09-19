# Script 5
# 04/09/2025
# Jorge Iván Garza Aldape
# 1677695

# Determinar media movil para saber el n ideal con respecto a la poblacion

data(iris)
View(iris)

setosa <- subset(iris, Species == "setosa")
View(setosa)

# Sumatoria acumulativa de la variable Sepal.Length

acumulado <- cumsum(setosa$Sepal.Length)
acumulado #Sumatoria acumulada

continuo <- seq(1:length(setosa$Sepal.Length))
continuo

# Crear data frame con los datos creados

set_mov <- data.frame(continuo, acumulado)
View(set_mov)

set_mov$movil <- acumulado / continuo
View(set_mov)
set_mov$movil <- round(acumulado / continuo, 2)
View(set_mov)

plot(continuo, set_mov$movil, type = "l",
     xlab = "Número de observaciones",
     ylab = "Media móvil",
     main = "N ideal en base a la poblacion")
abline(h = mean(setosa$Sepal.Length),
       col = "red3")
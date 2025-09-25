# Script 9
# 25/09/2025
# Jorge Iván Garza Aldape
# 1677695

# Regresion Lineal Simple

datos <- data.frame(
  Prod_trigo = c(30, 28, 32, 25, 25, 25, 22, 24, 35, 40),
  Costo_harina = c(25, 30, 27, 40, 42, 40, 50, 45, 30, 25)
  )
View(datos)

# Datos para B0 y B1

sumatoria <- sum(datos$Prod_trigo * datos$Costo_harina)
sumatoria

nxy <- length(datos$Prod_trigo) * mean(datos$Prod_trigo) * mean(datos$Costo_harina)
nxy

sumatoria - nxy

Xi2 <- sum(datos$Prod_trigo ^ 2)
Xi2

Nx2 <- length(datos$Prod_trigo) * mean(datos$Prod_trigo) ^ 2
Nx2

# B1

b1 <- (sumatoria - nxy) / (Xi2 - Nx2)
b1

# B0

b0 <- mean(datos$Costo_harina) - b1 * mean(datos$Prod_trigo)
b0

# Call

fit.lm <- lm (formula = datos$Costo_harina ~ datos$Prod_trigo)
summary(fit.lm)

# ANOVA para la RLS

anova(fit.lm)

# Resultados

# El valor de SSE es 207.93
# La varianza de los errores es 25.99
# La desviacion estandar residual es 5.09

# Revisar homocedasticidad

install.packages("lmtest")
library(lmtest)
bptest(fit.lm)

# Revisar homogeneidad

fit.lm$model
fit.lm$coefficients
fit.lm$residuals
mean(fit.lm$residuals)

# Agregar Y prima, recta y residuales a la tabla

datos$Yprima <- b0 + b1 * datos$Prod_trigo
View(datos)

datos$recta <- fit.lm$fitted.values
View(datos)

datos$residuales <- datos$Costo_harina - datos$recta
View(datos)

# sse es la suma de los cuadrados del error

sse <- sum(datos$residuales ^ 2)
sse / 8
sqrt(sse / 8)
# Gastos totales
300+240+1527+400+1500+1833
celular <- 300
celular
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833

5800*5
29000*2

abs(10)
abs(-4)
sqrt(9)
log(2)

# Hola Dr Tagle <3
4 + 5 # Aqui hay un comentario que R no debe ejecutar

# Detectar mayusculas y minusculas
Celular <- -300
CELULAR <- 8000

celular+celular
CELULAR-celular
celular+Celular

help(abs)
help(mean)
?mean
help.search("absolute")

# Autoevaluacion
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)
barplot(gastos)
gastos_ordenados <- sort(gastos, decreasing = TRUE)
barplot(gastos_ordenados)
names(gastos_ordenados) <- c("Otros",
                             "Comestibles",
                             "Alquiler",
                             "Gimnasio",
                             "Celular",
                             "Transporte")
barplot(gastos_ordenados, main = "Gastos mensuales", col = "purple")
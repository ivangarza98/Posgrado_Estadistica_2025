# Laboratorio 1: Empezar con R y RStudio
# 29/08/2025
# Jorge Ivan Garza Aldape
# 1677695

# Parte 1: R y RStudio -------------------------------------------------------------

# Gastos totales

300+240+1527+400+1500+1833

celular <- 300
celular

transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833

gastos_totales <- celular + transporte + comestibles + gimnasio + alquiler + otros
gastos_totales # Objeto total con la suma de los gastos

5800*5 # ¿Cuanto gastara la estudiante durante un semestre escolar?
29000*2 # ¿Cuanto gastara la estudiante durante un año escolar?

# Funciones

abs(10)
abs(-4)
sqrt(9)
log(2)

# Comentarios en R
# Hola Dr.
2 * 9
4 + 5 # Aqui hay un comentario que R no debe ejecutar

# Detectar mayusculas y minusculas

Celular <- -300
CELULAR <- 8000

celular+celular
CELULAR-celular
celular+Celular

# Obtener ayuda

help(abs)
help(mean)
?mean
help.search("absolute")
??absolute

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
barplot(gastos_ordenados, main = "Gastos mensuales", col = "purple", ylim = c(0,2000))

# Parte 2: Variables ------------------------------------------------------

# Problema 1: Identificar el tipo de variable (cualitativa o cuantitativa)

# Nombre de estudiante  - CUALITATIVA
# Fecha de nacimiento (p. Ej., 21/10/1995). - CUANTITATIVA
# Edad (en años). - CUANTITATIVA
# Dirección de casa (por ejemplo, 1234 Ave. Alamo). - CUALITATIVA
# Número de teléfono (por ejemplo, 510-123-4567). - CUALITATIVA
# Área principal de estudio.  - CUALITATIVA
# Grado de año universitario: primero, segundo, tercero, último año.  - CUALITATIVA
# Puntaje en la prueba de mitad de período (100 puntos posibles). - CUANTITATIVA
# Calificación general: A, B, C, D, F.  - CUALITATIVA
# Tiempo (en minutos) para completar la prueba final de MCF 202.  - CUANTITATIVA
# Numero de hermanos. - CUANTITATIVA

# Problema 2: Obtener 14 variables (7 cualitativas y 7 cuantitativas)

# Objeto de estudio: Automovil :car:

# Variables cualitativas (categoricas):
# Marca (Toyota, Ford, Nissan, etc.)
# Modelo (Corolla, Mustang, Sentra, etc.)
# Color (rojo, negro, azul, etc.)
# Tipo de transmisión (manual, automática, CVT)
# Tipo de combustible (gasolina, diésel, eléctrico, híbrido)
# País de fabricación (Japón, Alemania, México, etc.)
# Tipo de vehículo (sedán, SUV, pickup, hatchback)

# Variables cuantitativas:
# Precio (en pesos o dólares)
# Año de fabricación
# Cilindrada del motor
# Número de puertas
# Velocidad máxima (km/h)
# Rendimiento de combustible (km/l)
# Peso del vehículo (kg)

# Problema 3: Formas electrónicas de expresar opiniones personales

# Considere una variable con valores numéricos que describen formas electrónicas
# de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico;
# 3 = mensaje de texto; 4 = Facebook; 5 = blog. ¿Es esta una variable cuantitativa
# o cualitativa? Explique.

# R =
# Aunque la variable contiene valores numéricos (1, 2, 3, 4, 5), estos únicamente
# funcionan como códigos para identificar categorías de formas electrónicas
# de comunicación como Twitter, correo electrónico, mensaje de texto, Facebook y blog.
# No representan magnitudes ni permiten operaciones matemáticas significativas.
# Por lo tanto, es una variable cualitativa, ya que clasifica en categorías sin orden
# ni jerarquía.

# Problema 4: Para cada pregunta de investigación: (1) identifique a los individuos
# de interés (el grupo o grupos que se están estudiando), (2) identifique la(s)
# variable(s) (la característica sobre la que recopilaríamos datos) y
# (3) determine si cada variable es categórica o cuantitativa.

# ¿Cuál es la cantidad promedio de horas que los estudiantes de universidades públicas
# trabajan cada semana?
# R =
# - Individuos de interés: Estudiantes de universidades públicas.
# - Variable: Cantidad de horas trabajadas por semana.
# - Tipo de variable: Cuantitativa (horas y fracciones de hora).

# ¿Qué proporción de todos los estudiantes universitarios de México están inscritos en
# una universidad pública?
# R =
# - Individuos de interés: Estudiantes universitarios de México.
# - Variable: Tipo de universidad en la que están inscritos (pública o privada).
# - Tipo de variable: Cualitativa (clasifica a los estudiantes en dos categorías).

# En los universidades públicas, ¿las estudiantes femeninas tienen un promedio de CENEVAL
# más alto que los estudiantes varones?
# R =
# - Individuos de interés: Estudiantes de universidades públicas (femeninos y masculinos).
# - Variables: Sexo del estudiante y puntaje de CENEVAL.
# - Tipos de variables: Cualitativa (Sexo del estudiante) y Cuantitativa (Puntaje).

# ¿Es más probable que los atletas universitarios reciban asesoramiento académico que
# los atletas no universitarios?
# R =
# - Individuos de interés: Estudiantes universitarios (atletas y no atletas).
# - Variables: Es atleta (sí o no) y Recibe asesoramiento académico (sí o no)
# - Tipos de variables: Cualitativa (Es atleta) y Cualitativa (Recibe asesoramiento académico)

# Si reuniéramos datos para responder a las preguntas de la investigación anterior,
# ¿qué datos podrían analizarse mediante un histograma? ¿Cómo lo sabes?.
# R =
# Datos aptos para histograma: - Cantidad de horas trabajadas por semana (pregunta 1).
#                              - Puntajes de CENEVAL (pregunta 3).
# Razon: El histograma se utiliza para representar la distribución de variables cuantitativas.
# Asigancion 3: Contraste de medias
# 30/08/2025
# Jorge Ivan Garza Aldape
# 1677695

# Base de datos Iris ------------------------------------------------------

data(iris)
summary(iris)
head(iris)
View(iris)
str(iris)

# Operador %in%

iris_sub <- subset(iris, Species %in% c("versicolor", "virginica"))
iris_sub

# Estadistica descriptiva -------------------------------------------------

versicolor <- iris$Petal.Length[iris$Species == "versicolor"]
virginica <- iris$Petal.Length[iris$Species == "virginica"]

summary(versicolor)
summary(virginica)

mean(versicolor)
sd(versicolor)

mean(virginica)
sd(virginica)

# Prueba estadistica ------------------------------------------------------

# Pregunta de investigacion:
# ¿Existe una diferencia significativa en la longitud de los pétalos (Petal.Length)
# entre Iris versicolor e Iris virginica?

# Hipótesis estadísticas para una prueba t de dos muestras "two.sided":
# - H0 (nula): No existen diferencias significativas entre la longitud de los petalos de
# Iris versicolor e Iris virginica.
# - H1 (alternativa): Existen diferencias significativas entre la longitud de los petalos
# de Iris versicolor e Iris virginica.

# Ejecutar la prueba en R

# Homogeneidad de varianzas

var.test(versicolor, virginica)

# Prueba t de dos muestras independientes (Clasica)

# p-value = 0.2637 > 0.05. Se utilizo prueba de t clasica dado que no hay evidencia
# estadística suficiente para decir que las varianzas son distintas (var.equal = T).

t.test(versicolor, virginica, alternative = "two.sided", var.equal = T)

# Efecto de Cohen

library(effsize)
cohen.d(versicolor, virginica)
# El efecto de Cohen es de ~ -2.5, lo que corresponde a un efecto muy grande.

# Visualizacion -----------------------------------------------------------

boxplot(Petal.Length ~ Species, data = iris_sub,
        col = c("lightblue", "lightgreen"),
        main = "Comparación de Petal.Length entre Iris versicolor e Iris virginica",
        ylab = "Largo del pétalo (cm)",
        xlab = "Especies")

# Informe escrito ---------------------------------------------------------

# El presente análisis tuvo como objetivo determinar si existe una diferencia
# significativa en la longitud de los pétalos (Petal.Length) entre las especies Iris
# versicolor e Iris virginica, utilizando la base de datos iris en R. La pregunta central
# fue: ¿las dos especies presentan diferencias en la media de la longitud de los pétalos?
# Para responderla se plantearon las hipótesis: la hipótesis nula (H0) establece que las
# medias son iguales, mientras que la hipótesis alternativa (H1) sostiene que existen
# diferencias entre ambas.

# Como primer paso se verificó la homogeneidad de varianzas mediante una prueba F,
# obteniendo un estadístico F = 0.72497 y un valor p = 0.2637. Dado que el valor p es
# mayor que 0.05, no se rechaza la hipótesis nula de igualdad de varianzas, lo que
# permite aplicar la prueba t de Student clásica para comparar medias bajo el supuesto
# de varianzas iguales.

# La prueba t arrojó un valor t = -12.604 con un p-value < 2.2e-16, lo que indica que se
# rechaza la hipótesis nula. Esto significa que existen diferencias estadísticamente
# significativas en la longitud de los pétalos entre versicolor y virginica. La
# diferencia de medias fue aproximadamente -1.29, es decir, los pétalos de versicolor
# resultaron ser más cortos que los de virginica. Además, el tamaño del efecto medido
# con Cohen’s d fue cercano a -2.5, lo cual representa una diferencia extremadamente
# grande en magnitud.

# Los resultados gráficos a través de un boxplot comparativo, muestran visualmente que
# la distribución de la longitud de los pétalos de virginica se ubica en valores
# considerablemente más altos que los de versicolor, reforzando la evidencia estadística.

# Desde el punto de vista estadístico, el análisis demuestra que las medias difieren
# de manera muy significativa y que esta diferencia es de gran magnitud. Biológicamente,
# la longitud de los pétalos constituye un rasgo morfológico fundamental para distinguir
# entre ambas especies. Virginica presenta pétalos mucho más largos que versicolor,
# lo cual no solo valida su diferenciación taxonómica, sino que también resalta la
# importancia de este carácter floral en estudios de clasificación y ecología de plantas.
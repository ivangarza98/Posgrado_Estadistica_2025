setosa <- subset(iris, Species == "setosa")
mean(setosa$Sepal.Width)

# mu = 3.9 (media teoretica propuesta por alguien)

# H0 = No hay diferencias entre las medias de setosa (igual a 3.9)
# H1 = Existen diferencias entre la media teoretica y experimental (diferente de 3.9)

t.test(setosa$Sepal.Width, mu = 3.9, alternative = "two.sided")
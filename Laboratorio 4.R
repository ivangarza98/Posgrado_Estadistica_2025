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

colores <- c("khaki2", "ivory2")
boxplot(calidad$IE~ calidad$Tratamiento, col = colores,
        main = "Efecto del fertilizante sobre plantulas",
        xlab = "Tratamiento", ylab = "Índice de esbeltez",
        ylim = c(0.4,1.2))

# Aplicar subconjunto para cada tratamiento -------------------------------

df_control <- subset(calidad, Tratamiento == "Ctrl")
df_fertilizante <- subset(calidad, Tratamiento == "Fert")
View(df_control)
View(df_fertilizante)

par(mfrow = c(1,2))
qqnorm(df_control$IE); qqline(df_control$IE)
qqnorm(df_fertilizante$IE); qqline(df_fertilizante$IE)
par(mfrow = c(1,1))

# Revisar normalidad de los datos -----------------------------------------

shapiro.test(df_control$IE)
shapiro.test(df_fertilizante$IE)

# Revisar homogeneidad ----------------------------------------------------

var.test(calidad$IE ~ calidad$Tratamiento)
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", var.equal = T)
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", var.equal = F)
t.test(calidad$IE ~ calidad$Tratamiento, alternative = "greater", var.equal = T)

# Medir el efecto del tratamiento (Efecto de Cohen) -----------------------------------------

cohens <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2 <- sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
  (mean(x) - mean(y)) / sp
  }
efecto_calculado <- cohens(df_control$IE, df_fertilizante$IE)
efecto_calculado
round(efecto_calculado, 3)
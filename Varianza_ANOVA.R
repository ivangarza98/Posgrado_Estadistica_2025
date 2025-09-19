# Script 7
# 18/09/2025
# Jorge Iván Garza Aldape
# 1677695

# ANOVA de 1 factor

crop <- read.csv("crop.data.csv", header = T)
summary(crop)
View(crop)

# Convertir a factor para que reconozca los valores de cada bloque

crop$density <- as.factor(crop$density)
crop$block <- as.factor(crop$block)
crop$fertilizer <- as.factor(crop$fertilizer)
summary(crop)

# Visualizacion

colores <- c("darkolivegreen1", "darkgoldenrod1", "deeppink")
boxplot(crop$yield ~ crop$fertilizer,
        col = colores,
        xlab = "Fetilizantes",
        ylab = "Rendimiento (ton/ha)")

# Visualizacion violin

library(vioplot)
vioplot(crop$yield ~ crop$fertilizer,
        main = "Producción por fertilizante (ton/ha)",
        col= c("darkolivegreen1","darkgoldenrod1", "deeppink"),
        ylab = "Productividad",
        xlab = "Tipo de fertilizante",
        ylim = c(175, 179))

library(ggplot2)
ggplot(crop, aes(x=fertilizer, y=yield, fill = fertilizer))+
  geom_violin(trim = F, alpha = 0.5)+
  geom_boxplot(width = 0.07)+
  theme_light()+
  geom_jitter()+
  scale_fill_brewer()

# Estadistica rapida

tapply(crop$yield, crop$fertilizer, mean)
tapply(crop$yield, crop$fertilizer, var)

# Normalidad de los datos

shapiro.test(crop$yield)

# O bien, por separado:

shapiro.test(subset(crop$yield, crop$fertilizer == "1"))
shapiro.test(subset(crop$yield, crop$fertilizer == "2"))
shapiro.test(subset(crop$yield, crop$fertilizer == "3"))

# Prueba de Barlett (homogeneidad de varianzas para 2 o más poblaciones sin ser
# necesario que el tamaño de todas las muestras sea el mismo.)

bartlett.test(crop$yield ~ crop$fertilizer)

# H0 = Media del fert. 1 = Media del fert. 2 = Media del fert. 3
# H1 = Media del fert. 1 = Media del fert. 2 /= Media del fert. 3

# Aplicar ANOVA

crop.aov <- aov(crop$yield ~ crop$fertilizer)
summary(crop.aov)

# Detectar el LSD (diferencia minima significativa) entre los tratamientos

qt(0.975, 93)
sqrt((2 * 0.3859)/32) * qt(0.975, 93)

tapply(crop$yield, crop$fertilizer, mean)

# Primer diferencia de medias F1 vs F2

176.7570 - 176.9332 # Iguales

# Segunda diferencia de medias F2 vs F3

176.9332 - 177.3562 # Diferentes

# Tercera diferencia de medias F1 vs F3

176.7570 - 177.3562 #Diferentes

# Detectar el Tukey (tambien para diferencias entre grupos)

sqrt((0.3859)/32) * qtukey(0.95, nmeans = 3, df = 93)

# Detectar Tukey HSD (Diferencia mas honesta)

TukeyHSD(crop.aov)

# Visualización

plot(TukeyHSD(crop.aov))

# Tarea: Comparación Yield - Blocks ---------------------------------------

# Visualizacion

colores <- c("darkolivegreen1", "darkgoldenrod1", "deeppink", "firebrick")
boxplot(crop$yield ~ crop$block,
        col = colores,
        xlab = "Fetilizantes",
        ylab = "Rendimiento (ton/ha)")

# Visualizacion violin

library(vioplot)
vioplot(crop$yield ~ crop$block,
        main = "Producción por fertilizante (ton/ha)",
        col= c("darkolivegreen1","darkgoldenrod1", "deeppink", "firebrick"),
        ylab = "Productividad",
        xlab = "Tipo de fertilizante",
        ylim = c(175, 179))

library(ggplot2)
ggplot(crop, aes(x=block, y=yield, fill = block))+
  geom_violin(trim = F, alpha = 0.5)+
  geom_boxplot(width = 0.07)+
  theme_light()+
  geom_jitter()+
  scale_fill_brewer()

# Estadistica rapida

tapply(crop$yield, crop$block, mean)
tapply(crop$yield, crop$block, var)

# Normalidad de los datos

shapiro.test(crop$yield)

# O bien, por separado:

shapiro.test(subset(crop$yield, crop$block == "1"))
shapiro.test(subset(crop$yield, crop$block == "2"))
shapiro.test(subset(crop$yield, crop$block == "3"))
shapiro.test(subset(crop$yield, crop$block == "4"))

# Prueba de Bartlett (homogeneidad de varianzas para 2 o más poblaciones sin ser
# necesario que el tamaño de todas las muestras sea el mismo.)

bartlett.test(crop$yield ~ crop$block)

# H0 = Bloque 1 = Bloque 2 = Bloque 3 = Bloque 4 (ACEPTADA)
# H1 = Bloque 1 = Bloque 2 pero /= Bloque 3 ó /= Bloque 4

# Aplicar ANOVA

crop.aov2 <- aov(crop$yield ~ crop$block)
summary(crop.aov2)

# Detectar el LSD (diferencia minima significativa) entre los tratamientos

qt(0.975, 93)
sqrt((3 * 0.3859)/32) * qt(0.975, 93)

tapply(crop$yield, crop$block, mean)

# Primer diferencia de medias B1 vs B2

176.8564 - 177.3169 # Diferentes

# Segunda diferencia de medias B1 vs B3

176.8564 - 176.7126 # Iguales

# Tercera diferencia de medias B1 vs B4

176.8564 - 177.1760 # Iguales

# Cuarta diferencia de medias B2 vs B3

177.3169 - 176.7126 # Diferentes

# Quinta diferencia de medias B2 vs B4

177.3169 - 177.1760 # Iguales

# Sexta diferencia de medias B3 vs B4

176.7126 - 177.1760 # Diferentes

# Detectar el Tukey (tambien para diferencias entre grupos)

sqrt((0.3859)/32) * qtukey(0.95, nmeans = 4, df = 93)

# Detectar Tukey HSD (Diferencia mas honesta)

TukeyHSD(crop.aov2)

# Visualización

plot(TukeyHSD(crop.aov2))
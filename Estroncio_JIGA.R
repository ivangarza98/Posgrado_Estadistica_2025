# Script 8
# 19/09/2025
# Jorge Iván Garza Aldape
# 1677695

# ANOVA de 1 factor (Tarea)

# Crear el data.frame
cuerpos_agua <- factor(rep(c("Graysons_Pond", "Beaver_Lake", "Anglers_Cove",
                             "Appletree_Lake", "Rock_River"), each = 6))
concentracion <- c(28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
                   39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
                   46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
                   41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
                   56.3, 54.1, 59.4, 62.7, 60.0, 57.3)  # Rock River

datos_estroncio <- data.frame(cuerpos_agua, concentracion)

# Analisis de varianza (ANOVA)
modelo_anova <- aov(concentracion ~ cuerpos_agua, data = datos_estroncio)

# tabla de ANOVA
summary(modelo_anova)

# Hipotesis

# H0 = No existen diferencias estadísticamente significativas entre las medias de las
# concentraciones de estroncio de los cinco cuerpos de agua. (Se rechaza)

# H1 = Existe una diferencia estadísticamente significativa en la media de la
# concentración de estroncio de al menos un cuerpo de agua con respecto a los demás.

# Prueba LSD

library(agricolae)
lsd_resultado <- LSD.test(modelo_anova, "cuerpos_agua", alpha = 0.05, console = TRUE)

# Calcule el valor de LSD con α = 0.05.

# R = 3.715779 mg/ml

# Compare las diferencias entre medias de los sitios.

# Sitios	(1 vs 2)                Media Sitio 1	 Media Sitio 2  Diferencia	¿Es > 3.715779?	  Conclusión
# Rock River vs. Grayson's Pond	       58.30	       32.08	      26.22	          Sí	       Significativa
# Rock River vs. Beaver Lake	         58.30	       40.23	      18.07	          Sí	       Significativa
# Rock River vs. Appletree Lake	       58.30	       41.10	      17.20	          Sí	       Significativa
# Rock River vs. Angler's Cove	       58.30	       44.08	      14.22	          Sí	       Significativa
# Angler's Cove vs. Grayson's Pond	   44.08	       32.08	      12.00	          Sí	       Significativa
# Angler's Cove vs. Beaver Lake	       44.08	       40.23	       3.85	          Sí	       Significativa
# Angler's Cove vs. Appletree Lake	   44.08	       41.10	       2.98	          No	       No Significativa
# Appletree Lake vs. Grayson's Pond	   41.10	       32.08	       9.02	          Sí	       Significativa
# Appletree Lake vs. Beaver Lake	     41.10	       40.23	       0.87	          No	       No Significativa
# Beaver Lake vs. Grayson's Pond	     40.23	       32.08	       8.15	          Sí	       Significativa

# Determine cuáles pares son significativamente diferentes.

# R = Rock River vs. Grayson's Pond
#     Rock River vs. Beaver Lake
#     Rock River vs. Appletree Lake
#     Rock River vs. Angler's Cove
#     Angler's Cove vs. Grayson's Pond
#     Angler's Cove vs. Beaver Lake
#     Appletree Lake vs. Grayson's Pond
#     Beaver Lake vs. Grayson's Pond

# Prueba de Tukey HSD

tukey_resultado <- TukeyHSD(modelo_anova)
print(tukey_resultado)

# Obtenga el valor crítico

valor_critico <- qtukey(0.95, nmeans = 5, df = 25)
print(valor_critico)

# Calcule la diferencia mínima significativa con Tukey (Forma 1).

dif_min_sig <- valor_critico * sqrt (9.8/6)
print(dif_min_sig)

# Calcule la diferencia mínima significativa con Tukey (Forma 2).

library(agricolae)
dif_min_sig_agri <- HSD.test(modelo_anova, "cuerpos_agua", console = TRUE)

# Compare los resultados con la prueba LSD: ¿los mismos pares resultan significativos?
# R = Si, solo Angler's Cove vs. Beaver Lake es detectado por LSD, los demas son los
#     mismos.

# Pares significaticos con LSD          Pares significativos con HSD

# Rock River vs. Grayson's Pond         Rock River vs. Grayson's Pond
# Rock River vs. Beaver Lake            Rock River vs. Beaver Lake
# Rock River vs. Appletree Lake         Rock River vs. Appletree Lake
# Rock River vs. Angler's Cove          Rock River vs. Angler's Cove
# Angler's Cove vs. Grayson's Pond      Grayson's Pond vs. Rock River
# Angler's Cove vs. Beaver Lake         Grayson's Pond vs. Angler's Cove
# Appletree Lake vs. Grayson's Pond     Grayson's Pond vs. Appletree Lake
# Beaver Lake vs. Grayson's Pond        Grayson's Pond vs. Beaver Lake

# Interpretacion

# ¿Que cuerpo de agua presenta las concentraciones más altas?
# Grupo alto: Rock River

# ¿Qué sitios no difieren entre sí?
# Grupo intermedio: Angler's Cove, Appletree Lake y Beaver Lake.

# Desde el punto de vista ambiental, ¿qué implicaciones podrían tener estas diferencias
# en la calidad del agua?
# Los cuerpos de agua están siendo afectados por diferentes factores, ya sean naturales
# o de origen humano. No todos los sitios comparten la misma calidad de agua.

# La concentración más alta de estroncio en Rock River podría apuntar a dos posibles
# causas principales: 1. Contaminación puntual por descargas industriales (metalurgia,
# vidrio, aleaciones), por actividad minera (celestita o sulfato de estroncio,
# estroncianita o carbonato de estroncio) y por escorrentía agrícola (algunos
# fertilizantes fosfatados pueden contener estroncio como impureza). 2. Geología local:
# el rio podría atravesar una zona geologica rica en minerales de estroncio que con la
# erosion y lixiviación del suelo se podria contaminar el agua continuamente.

# Grayson´s Pond es un sitio referencia o control. Representa la condición de fondo o
# "natural" de la región, con mínima influencia de contaminación y permite decir con
# confianza que los niveles en Rock River son anormalmente altos. Se debería hacer un
# monitoreo ambiental de la calidad (niveles) del agua a largo plazo.

# Beaver Lake, Angler's Cove y Appletree Lake representan la calidad del agua "típica"
# de la zona sin la influencia de una fuente contaminante fuerte.
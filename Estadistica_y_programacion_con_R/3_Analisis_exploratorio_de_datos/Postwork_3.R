#============================ Lectura de datos =================================

liga_es_1720 <- read.csv("liga_es_1720.csv")

head(liga_es_1720); tail(liga_es_1720)

#=========================== Identificar columnas ==============================

# Goles de equipo locales
liga_es_1720$FTHG
# Goles de equipos visitantes
liga_es_1720$FTAG

#========================= Tablas de frecuencia ================================

# Tabla Local
(frec_loc <- table(liga_es_1720$FTHG))

# Tabla Visitante
(frec_vis <- table(liga_es_1720$FTAG))

#========================= Probabilidad marginal ===============================

# Probabilidad Local
(prob_marg_loc <- round(frec_loc/sum(frec_loc), 3))

# Probabilidad Visitante
(prob_marg_vis <- round(frec_vis/sum(frec_vis), 3))

# ========================= Probabilidad conjunta ==============================

(prob_conj <- round(table(liga_es_1720$FTHG, liga_es_1720$FTAG)/dim(liga_es_1720)[1], 3))

# =========================== Graficas de probabilidad =========================

library(ggplot2)
library(ggdark)

p <- ggplot(as.data.frame(prob_marg_loc), aes(x=Var1, y=Freq))+
      geom_col(color='white',fill='brown4')+
      labs(x = "Goles", 
         y = "Probabilidad",
        title = "Probabilidades marginales estimadas del número de goles",
        subtitle= "Equipo Local") +
      theme(plot.title = element_text(size=22)) +
      dark_theme_gray() 

p

png(filename="prob_marg_loc.png", width = 900)
p
dev.off()


p <- ggplot(as.data.frame(prob_marg_vis), aes(x=Var1, y=Freq))+
  geom_col(color='white',fill='deepskyblue4')+
  labs(x = "Goles", 
       y = "Probabilidad",
       title = "Probabilidades marginales estimadas del número de goles",
       subtitle= "Equipo Visitante") +
  theme(plot.title = element_text(size=22)) +
  dark_theme_gray() 

p

png(filename="prob_marg_vis.png", width = 900)
p
dev.off()


# =============================== HeatMap ======================================
library(reshape2)

prob_conj <- melt(prob_conj)
prob_conj <- rename(prob_conj, ProbEst = value)

p <- ggplot(prob_conj, aes(Var1, Var2)) + 
      geom_tile(aes(fill = ProbEst)) + 
      labs(x = "Goles Local", 
           y = "Goles Visitante",
           title = "Probabilidades conjuntas estimadas",
           subtitle= "HeatMap")+
      scale_fill_gradient(low = 'black', high = 'purple') + 
      theme(axis.text.x = element_text(angle = 90,hjust = 0))+
      dark_theme_gray()

p

png(filename="prob_conj.png", width = 900)
p
dev.off()

#Lectura de datos
prim_div <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

head(prim_div)

#Identificar columnas
prim_div$FTHG
prim_div$FTAG

#Tablas de frecuencia
(frec_loc <- table(prim_div$FTHG))

(frec_vis <- table(prim_div$FTAG))
frec_vis[7] <- 0

#Tabla de frecuancia absoluta
tabla_frec <- rbind("Local" = frec_loc, "Visitante" = frec_vis)

#Probailidad marginal
prob_marg_loc <- tabla_frec["Local",]/sum(tabla_frec["Local",])
prob_marg_vis <- tabla_frec["Visitante",]/sum(tabla_frec["Visitante",])

rbind("Local" = prob_marg_loc, "Visitante" = prob_marg_vis)

#Probabilidad conjunta
prob_conj_loc <- tabla_frec["Local",]/(sum(tabla_frec["Local",])+sum(tabla_frec["Visitante",]))
prob_conj_vis <- tabla_frec["Visitante",]/(sum(tabla_frec["Local",])+sum(tabla_frec["Visitante",]))

rbind("Local" = prob_conj_loc, "Visitante" = prob_conj_vis)
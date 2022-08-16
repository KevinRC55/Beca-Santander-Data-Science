#Lectura de datos
prim_div <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

head(prim_div)

#Identificar columnas
prim_div$FTHG
prim_div$FTAG

#Tablas de frecuencia
frec_loc <- table(prim_div$FTHG)

frec_vis <- table(prim_div$FTAG)
frec_vis[7] <- 0

#Tabla de frecuencia absoluta
(tabla_frec <- rbind("Local" = frec_loc, "Visitante" = frec_vis))

#Probabilidad marginal
prob_marg_loc <- (tabla_frec["Local",]/sum(tabla_frec["Local",]))*100
prob_marg_vis <- (tabla_frec["Visitante",]/sum(tabla_frec["Visitante",]))*100

rbind("Local" = prob_marg_loc, "Visitante" = prob_marg_vis)
## Existe mayor probabilidad de que el equipo local anote 1 gol
## Existe mayor probabilidad de que el equipo visitante anote 0 goles

#Probabilidad conjunta
((table(prim_div$FTHG, prim_div$FTAG)/dim(prim_div)[1])*100)
## Existe mayo probabilidad de que el marcador sea 1 - 0 a favor del local

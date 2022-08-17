#============================== Lectura de datos ===============================

liga_es_1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
liga_es_1819 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
liga_es_1920 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#============================== Exploración ====================================

str(liga_es_1718)
summary(liga_es_1718)
head(liga_es_1718); tail(liga_es_1718)
View(liga_es_1718)

str(liga_es_1819)
summary(liga_es_1819)
head(liga_es_1819); tail(liga_es_1819)
View(liga_es_1819)

str(liga_es_1920)
summary(liga_es_1920)
head(liga_es_1920); tail(liga_es_1920)
View(liga_es_1920)

# ========================= Selección de columnas ==============================

library(dplyr)

list <- list(liga_es_1718, liga_es_1819, liga_es_1920)
list[1:2] <- lapply(list[1:2], select, Date:FTR)
list[3] <- lapply(list[3], select, Date:FTR, -Time)

#============================ Formato fecha ====================================

lapply(list, str)
list <- lapply(list, mutate, Date = as.Date(Date))

#============================= Data Frame único ================================

#rbind(list[[1]], list[[2]], list[[2]])
liga_es_1720 <- do.call(rbind, list)

head(liga_es_1720); tail(liga_es_1720)

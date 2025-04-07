# Carregar pacotes
library(WDI)
library(tidyverse)

# === DADOS EM PAINEL (todos os países, todos os anos disponíveis) ===
taxasuicidio_painel <- WDI(country = "all",
                           indicator = "SH.STA.SUIC.MA.P5",
                           extra = TRUE) %>%
  filter(region != "Aggregates")  # Remove grupos agregados (como "World")
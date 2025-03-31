# Taxa de mortalidade por suicídio, homens
library(WDI)
library(tidyverse)

# DADOS EM PAINEL
taxasuicidio <- WDI(country = "all",
                    indicator = "SH.STA.SUIC.MA.P5")

# CORTE TRANSVERSAL 
taxasuicidio2015 <- WDI(country = "all",
                        indicator = "SH.STA.SUIC.MA.P5",
                        start = 2015, end = 2015)

# SÉRIE TEMPORAL 
taxasuicidio2015 <- WDI(country = "BR",
                        indicator = "SH.STA.SUIC.MA.P5",
                        start = 2015, end = 2015)
#Dados em Painel
grafpainel <- ggplot(taxasuicidio,
                     mapping=aes(y = SH.STA.SUIC.MA.P5,
                                 x = year)) +
  geom_point()

print(grafpainel)

#Corte Transversal
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD')
grafserie <- ggplot(dadospib2023,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_line()

print(grafserie)

#Corte Transversal
dadospib <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD')
grafserie <- ggplot(basepib,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_line()
print(grafserie)

# DADOS EM PAINEL
grafpainel <- ggplot(taxasuicidio,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_point()
print(grafpainel)

# SÉRIE TEMPORAL

grafserie <- ggplot(taxasuicidio,
                    mapping = aes(y = SH.STA.SUIC.MA.P5,
                                  x = year)) +
  geom_line()
print(grafserie)

# CORTE TRANSVERSAL

grafcorte <- ggplot(taxasuicidio,
                    mapping = aes(y = SH.STA.SUIC.MA.P5,
                                  x = year)) +
  geom_point()
print(grafcorte)

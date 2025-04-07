# === 1. SÉRIE TEMPORAL: Taxa de suicídio (homens) no Brasil de 2000 a 2022 ===
brasil_suicidio <- WDI(country = "BR",
                       indicator = "SH.STA.SUIC.MA.P5",
                       start = 2000, end = 2022)

ggplot(brasil_suicidio, aes(x = year, y = SH.STA.SUIC.MA.P5)) +
  geom_line(color = "darkred", size = 1.2) +
  labs(title = "Taxa de suicídio (homens) no Brasil (2000–2022)",
       x = "Ano", y = "Taxa por 100 mil habitantes") +
  theme_minimal()
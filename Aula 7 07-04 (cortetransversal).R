# Instalar pacotes se necessário (descomente se precisar)
# install.packages(c("WDI", "tidyverse", "scales", "dplyr", "ggplot2"))

# Carregar pacotes explicitamente
library(WDI)
library(dplyr)    # Para mutate() e funções de manipulação
library(ggplot2)  # Para gráficos
library(scales)   # Para formatação de eixos

# === Buscar dados ===
dados_suicidio <- WDI(
  country = "all",
  indicator = "SH.STA.SUIC.MA.P5",
  extra = TRUE
)

# === Processamento seguro ===
top10_2015 <- dados_suicidio %>% 
  dplyr::filter(
    year == 2015,
    !is.na(SH.STA.SUIC.MA.P5),
    region != "Aggregates"
  ) %>%
  dplyr::slice_max(
    order_by = SH.STA.SUIC.MA.P5,
    n = 10
  ) %>%
  dplyr::mutate(
    country = forcats::fct_reorder(country, SH.STA.SUIC.MA.P5)
  )

# === Gráfico ===
ggplot2::ggplot(top10_2015, 
                aes(x = country, 
                    y = SH.STA.SUIC.MA.P5, 
                    fill = region)) +
  geom_col(width = 0.8) +
  geom_text(
    aes(label = round(SH.STA.SUIC.MA.P5, 1)),
    hjust = -0.2, 
    size = 3.5
  ) +
  coord_flip() +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +
  labs(
    title = "TOP 10 PAÍSES COM MAIOR TAXA DE SUICÍDIO MASCULINO (2015)",
    subtitle = "Taxa por 100 mil habitantes homens",
    caption = "Fonte: Banco Mundial (WDI)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_blank()
  )

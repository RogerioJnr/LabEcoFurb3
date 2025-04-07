# Carregar pacotes necessários
library(WDI)
library(dplyr)
library(ggplot2)
library(scales)

# Buscar os dados do Banco Mundial
taxasuicidio_painel <- WDI(
  country = "all",
  indicator = "SH.STA.SUIC.MA.P5", # Taxa de suicídio masculino
  extra = FALSE,                   # Não carregar metadados extras
  start = 2000,                    # Ano inicial
  end = 2022                       # Ano final
)

# Selecionar países específicos
paises_selecionados <- c("Brazil", "United States", "Japan", "Russian Federation", "India")

# Filtrar e preparar os dados
painel_amostra <- taxasuicidio_painel %>%
  filter(country %in% paises_selecionados,
         !is.na(SH.STA.SUIC.MA.P5)) %>%  # Remover valores missing
  mutate(country = case_when(             # Padronizar nomes
    country == "Russian Federation" ~ "Russia",
    TRUE ~ country
  ))

# Criar o gráfico de evolução
ggplot(painel_amostra, aes(x = year, y = SH.STA.SUIC.MA.P5, color = country)) +
  geom_line(size = 1.2, alpha = 0.8) +
  geom_point(size = 2) +  # Adiciona pontos para melhor visualização
  scale_x_continuous(breaks = seq(2000, 2022, by = 2)) +  # Eixo X a cada 2 anos
  scale_y_continuous(labels = comma_format(big.mark = ".", decimal.mark = ",")) +  # Formato numérico
  labs(
    title = "Evolução da Taxa de Suicídio Masculino (2000-2022)",
    subtitle = "Taxa por 100 mil habitantes homens",
    x = "Ano",
    y = "Taxa de suicídio",
    color = "País",
    caption = "Fonte: Banco Mundial (WDI)\nIndicador: SH.STA.SUIC.MA.P5"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 14),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40"),
    plot.caption = element_text(color = "gray50", hjust = 0),
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  scale_color_brewer(palette = "Set1")  # Paleta de cores distinta

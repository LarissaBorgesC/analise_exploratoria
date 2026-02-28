library(ggplot2)
library(dplyr)

# ETL
dados <- read.csv("datatran2024.csv", sep = ";", stringsAsFactors = FALSE, encoding = "latin1") |>
  mutate(
    veiculos = as.numeric(veiculos),
    feridos = as.numeric(feridos)
  ) |>
  filter(!is.na(veiculos), !is.na(feridos), condicao_metereologica != "")

# Teste Qui-Quadrado
teste_clima <- chisq.test(table(dados$condicao_metereologica))

# IC VEICULOS
estatisticas_v <- dados |> 
  summarise(
    media = mean(veiculos),
    sd = sd(veiculos),
    n = n(),
    se = sd / sqrt(n),
    ic_inf = media - qt(0.975, df = n - 1) * se,
    ic_sup = media + qt(0.975, df = n - 1) * se
  )

# Correlação (Veículos vs Feridos)
relacao_corr <- cor.test(dados$veiculos, dados$feridos, use = "complete.obs")


print(teste_clima)
cat("IC 95% Média de Veículos:", estatisticas_v$ic_inf, "até", estatisticas_v$ic_sup, "\n")
print(relacao_corr)

# 3. VISUALIZAÇÃO (GGPLOT2) ------------------------------------------------

# boxplot: número de Veículos por Clima
ggplot(dados, aes(x = condicao_metereologica, y = veiculos, fill = condicao_metereologica)) +
  geom_boxplot(outlier.alpha = 0.2) + 
  coord_flip() + 
  labs(title = "Distribuição de Veículos por Condição Meteorológica",
       subtitle = "Acidentes Rodoviários Federais - 2024",
       x = "Condição Meteorológica", y = "Número de Veículos") +
  theme_minimal() + theme(legend.position = "none")

# boxplot: Frequência Diária de Acidentes
dados |>
  group_by(data_inversa, condicao_metereologica) |>
  summarise(n_acidentes = n(), .groups = 'drop') |>
  ggplot(aes(x = reorder(condicao_metereologica, n_acidentes, median), 
             y = n_acidentes, fill = condicao_metereologica)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 8) +
  coord_flip() +
  labs(title = "Distribuição da Frequência Diária de Acidentes",
       subtitle = "Análise por condição climática",
       x = "Condição Meteorológica", y = "Acidentes por Dia") +
  theme_minimal() + theme(legend.position = "none")
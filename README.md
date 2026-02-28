# 📊 Análise Estatística de Acidentes Rodoviários Federais (2024)

Este repositório contém uma análise inferencial e visual dos dados de acidentes rodoviários registrados pela Polícia Rodoviária Federal (PRF) no ano de 2024. O projeto aplica conceitos fundamentais de estatística frequentista (Fisher e Neyman-Pearson) para extrair insights sobre segurança viária.

## 🎯 Objetivos do Projeto

- **Teste de Hipótese:** Verificar se as condições meteorológicas influenciam significativamente a ocorrência de acidentes.
- **Estimativa Paramétrica:** Calcular o intervalo de confiança para a média de veículos envolvidos.
- **Análise de Correlação:** Avaliar a relação entre o número de veículos envolvidos e o número de vítimas feridas.
- **Visualização Avançada:** Utilizar Boxplots para entender a dispersão e a frequência dos dados.

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** R
- **Bibliotecas:** `ggplot2`, `dplyr`
- **Ambiente:** VS Code com suporte para R (`languageserver`)

## 📋 Como Executar

1. Certifique-se de ter o arquivo `datatran2024.csv` no diretório raiz.
2. No VS Code, instale a extensão **R** de Yuki Ueda.
3. Instale as dependências executando no console do R:
   ```R
   install.packages(c("ggplot2", "dplyr", "languageserver"))

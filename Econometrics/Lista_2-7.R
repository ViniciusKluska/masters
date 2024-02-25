# Carregando a biblioteca necessária para operações estatísticas
library(stats)

# Definindo os parâmetros do problema
n <- 10  # Número total de tentativas
p <- 0.5  # Probabilidade de sucesso sob a hipótese nula (adivinhação)

# Calculando a probabilidade de acertar exatamente 9 vezes
prob_9 <- dbinom(9, size = n, prob = p)

# Calculando a probabilidade de acertar exatamente 10 vezes
prob_10 <- dbinom(10, size = n, prob = p)

# Calculando a probabilidade combinada de acertar 9 ou 10 vezes
prob_9_or_10 <- prob_9 + prob_10

# Mostrando a probabilidade combinada
prob_9_or_10

# Interpretação dos resultados
# Se a probabilidade combinada de acertar 9 ou 10 vezes é significativamente baixa (por exemplo, menor que 5%),
# isso indica uma evidência contra a hipótese nula. Isso sugere que a senhora não está simplesmente adivinhando,
# mas tem a habilidade de distinguir entre as duas maneiras de preparar o chá.

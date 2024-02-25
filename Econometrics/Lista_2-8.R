# Carregando a biblioteca necessária para operações estatísticas
library(stats)

# Definindo o número de lançamentos e o número de vezes que o fantasma apareceu
n_lancamentos <- 50
n_fantasma <- 16

# Probabilidade esperada de rolar o fantasma sob a hipótese nula
p_fantasma <- 1/6

# Realizando o teste exato binomial
teste_binomial <- binom.test(n_fantasma, n_lancamentos, p_fantasma, alternative = "two.sided")

# Mostrando os resultados do teste
teste_binomial

# O resultado do teste nos dará um p-valor. Um p-valor pequeno (tipicamente, menor que 0,05)
# sugere que os dados observados são improváveis sob a hipótese nula, indicando que há motivos
# para estar preocupado de que o dado não seja justo. Isso significa que a probabilidade de rolar
# o fantasma é significativamente diferente de 1/6, com base nos dados coletados dos 50 lançamentos.

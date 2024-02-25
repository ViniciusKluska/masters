
# Estimação e Teste de Hipóteses

# 1. Desenvolvimento do exercício
# Considere um estudo em que estamos interessados em determinar se a média de horas estudadas por
# estudantes universitários difere de 5 horas por dia. Uma amostra de 30 estudantes é selecionada,
# e o número de horas estudadas por dia é registrado. Os dados da amostra são os seguintes:
horas_estudadas <- c(6, 4, 5, 7, 5, 6, 4, 5, 6, 5, 6, 5, 4, 5, 6, 5, 4, 5, 6, 5, 7, 5, 6, 4, 5, 6, 5, 4, 5, 6)

# (a) Calcular a média amostral e o desvio padrão amostral
media_amostral <- mean(horas_estudadas)
desvio_padrao_amostral <- sd(horas_estudadas)

# (b) Realizar um teste de hipóteses para verificar se a média de horas estudadas difere de 5 horas.
# Hipóteses:
# H0: μ = 5 (a média de horas estudadas é 5 horas)
# Ha: μ != 5 (a média de horas estudadas é diferente de 5 horas)

# Nível de significância
alpha <- 0.05

# Realizando o teste t
t_resultado <- t.test(horas_estudadas, mu = 5, alternative = "two.sided")

# Resposta do exercício
# (a) Cálculo da média amostral e do desvio padrão amostral
print(paste("Média amostral:", media_amostral))
print(paste("Desvio padrão amostral:", desvio_padrao_amostral))

# (b) Resultado do teste de hipóteses
print(t_resultado)

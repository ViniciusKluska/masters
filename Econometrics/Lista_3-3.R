# Carregando bibliotecas necessárias
library(lmtest)
library(sandwich)

# Dados fornecidos
Y <- c(8, 5, 4, 3, 1)
X2 <- c(5, 3, 3, 1, 1)
X3 <- c(1, 2, 2, 3, 4)

# Criando o modelo de regressão
modelo <- lm(Y ~ X2 + X3)

# (a) Calcular as estimativas de β1, β2, e β3
estimativas <- coef(modelo)

# (b) Calcular a variância estimada total
variancia_total <- summary(modelo)$sigma^2

# (c) Calcular o coeficiente de determinação R^2
R2 <- summary(modelo)$r.squared

# (d) Fazer o quadro de análise de variância (ANOVA) e calcular o teste F
anova_modelo <- anova(modelo)
teste_F <- summary(anova_modelo)["F value"]

# (e) Calcular a matriz de variância-covariância da regressão estimada
matriz_var_cov <- vcovHC(modelo, type = "HC")

# Realizar os testes de significância
teste_significancia <- coeftest(modelo, vcov. = matriz_var_cov)

# (f) Calcular o intervalo de confiança para as estimativas dos parâmetros β1, β2, e β3, com 95% probabilidade
IC_estimativas <- confint(modelo, level = 0.95)

# (g) Para x10 = 2 e X20 = 4
# i. Calcular a previsão pontual
previsao_pontual <- predict(modelo, newdata = data.frame(X2 = 2, X3 = 4), interval = "none")

# ii. Calcular o intervalo de confiança da previsão média com 95% de probabilidade
IC_previsao_media <- predict(modelo, newdata = data.frame(X2 = 2, X3 = 4), interval = "confidence", level = 0.95)

# iii. Calcular o intervalo de confiança da previsão individual com 95% de probabilidade
IC_previsao_individual <- predict(modelo, newdata = data.frame(X2 = 2, X3 = 4), interval = "prediction", level = 0.95)

# Armazenando todas as respostas em uma lista e exibindo os resultados
resposta <- list(estimativas = estimativas, variancia_total = variancia_total, R2 = R2, anova_modelo = anova_modelo, 
                 teste_F = teste_F, matriz_var_cov = matriz_var_cov, teste_significancia = teste_significancia, 
                 IC_estimativas = IC_estimativas, previsao_pontual = previsao_pontual, 
                 IC_previsao_media = IC_previsao_media, IC_previsao_individual = IC_previsao_individual)

print(resposta)

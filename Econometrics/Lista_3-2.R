# Carregando bibliotecas necessárias para operações estatísticas avançadas
library(lmtest)
library(sandwich)

# Dados fornecidos
X <- c(1, 1, 2, 2, 3, 3)
Y <- c(8, 7, 4, 4, 1, 0)

# (a) Calcular as médias de X e de Y
media_X <- mean(X)
media_Y <- mean(Y)

# (b) Calcular as variâncias de Xi e de Yi e a covariância entre Xi e Yi
var_X <- var(X)
var_Y <- var(Y)
cov_XY <- cov(X, Y)

# (c) Calcular o coeficiente de correlação
cor_XY <- cor(X, Y)

# (d) Calcular beta_1 (ˆ β1) e beta_2 (ˆ β2) e apresentar a equação de regressão estimada
modelo <- lm(Y ~ X)
beta_1 <- coef(modelo)[1]
beta_2 <- coef(modelo)[2]

# (e) Calcular as variâncias de beta_1 (ˆ β1) e beta_2 (ˆ β2)
variancias <- vcovHC(modelo, type = "HC")

# (f) Verificar as hipóteses através do teste de significância
teste_beta_1 <- coeftest(modelo, vcov. = variancias)[1,]
teste_beta_2 <- coeftest(modelo, vcov. = variancias)[2,]

# (g) Calcular o coeficiente de determinação R^2 e interpretar o resultado
R2 <- summary(modelo)$r.squared

# (h) Através da análise de variância da regressão estimada, verificar a hipótese
anova_teste <- anova(modelo)

# (i) Calcular os intervalos de confiança de 95% para as estimativas de beta_1 (ˆ β1) e beta_2 (ˆ β2)
IC_beta_1 <- confint(modelo, level = 0.95)[1,]
IC_beta_2 <- confint(modelo, level = 0.95)[2,]

# (j) Calcular o intervalo de confiança com 95% de probabilidade para a previsão média para X0 = 4 e
# previsão individual X0 = 5.
IC_previsao_media <- predict(modelo, newdata = data.frame(X = 4), interval = "confidence", level = 0.95)
IC_previsao_individual <- predict(modelo, newdata = data.frame(X = 5), interval = "prediction", level = 0.95)

# Armazenando todas as respostas em uma lista
resposta <- list(media_X = media_X, media_Y = media_Y, var_X = var_X, var_Y = var_Y, cov_XY = cov_XY, cor_XY = cor_XY,
                 beta_1 = beta_1, beta_2 = beta_2, variancias = variancias, teste_beta_1 = teste_beta_1, teste_beta_2 = teste_beta_2,
                 R2 = R2, anova_teste = anova_teste, IC_beta_1 = IC_beta_1, IC_beta_2 = IC_beta_2, 
                 IC_previsao_media = IC_previsao_media, IC_previsao_individual = IC_previsao_individual)

# Exibindo os resultados com um comando print
print(resposta)

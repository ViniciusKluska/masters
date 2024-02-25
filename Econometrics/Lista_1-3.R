# Carregando biblioteca necessária para operações de álgebra linear
library(Matrix)

# Criando a matriz X
X <- matrix(c(1, 1, 1, 1, 1,
              5, 3, 3, 1, 1,
              1, 2, 2, 3, 4), byrow = FALSE, nrow = 5)

# Mostrando a matriz X
X
# Calculando X^T X
XTX <- t(X) %*% X

# Mostrando X^T X
XTX
# Calculando raízes e vetores característicos
eig_vals <- eigen(XTX)$values
eig_vecs <- eigen(XTX)$vectors

# Mostrando os resultados
eig_vals
eig_vecs
# Calculando o número de condição
cond_number <- sqrt(max(eig_vals) / min(eig_vals))

# Mostrando o número de condição
cond_number
# Calculando o traço
trace_XTX <- sum(eig_vals)

# Mostrando o traço
trace_XTX
# Calculando o determinante
det_XTX <- prod(eig_vals)

# Mostrando o determinante
det_XTX
# Verificando se a inversa existe (determinante não zero)
if(det_XTX != 0) {
  # Calculando a inversa
  XTX_inv <- solve(XTX)
  
  # Raízes características da inversa
  eig_vals_inv <- eigen(XTX_inv)$values
  
  # Mostrando as raízes características da inversa
  eig_vals_inv
} else {
  print("A inversa não existe, determinante é zero.")
}
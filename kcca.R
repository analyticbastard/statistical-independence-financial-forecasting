library(kernlab)

# x e y=x^2
x=as.matrix(c(-10:10))
y=as.matrix(x**2)

# alta correlacion
m=kcca(x, y)
tail(m@kcor,-2)

# Numeros pseudoaleatorios
x=matrix(rnorm(100),100,1)
y=matrix(rnorm(100),100,1)

# Correlacion cercana a cero
m=kcca(x, y, kpar = list(sigma=0.01))
tail(m@kcor,-2)


# Funcion de pruebas maxkcca para calcular la correlacion
# maxima no lineal en el feature space generado por un RKHS
# para los datos del argumento coin
maxkcca <- function(coin, days, sigma=1, gamma=0.1) {
  x=as.matrix(tail(head(coin, days), -1))
  y=as.matrix(head(head(coin, days), -1))

  m=kcca(x, y, kpar = list(sigma=sigma), gamma = gamma)
  return(m@kcor[3])
}

# Correlacion cercana a cero
maxkcca(btcr, 100,1,0.2)
# Correlacion cercana a cero
maxkcca(btcr, 300,0.5,0.2)
# Correlacion sorprendentemente alta 0.2133682
maxkcca(ethr, 100,0.1,0.2)
# Correlacion sorprendentemente alta 0.1485429
maxkcca(ethr, 300,0.1,0.2)


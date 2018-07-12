library(ForeCA)

# Medida omega sobre cada serie
Omega(btcr)
Omega(ethr)
Omega(ltcr)

# Union de las 3 variables
data=matrix(c(tail(btcr,1064), tail(ethr,1064), tail(ltcr,1064)), ncol=3)

# Calculo de componentes predecibles
ff=foreca(data, n.comp = 2)
plot(ff)
ff$scores

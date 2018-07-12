install.packages(c("ForeCA", "hsicCCA", "crypto"))

library(crypto)

btc=daily_market('bitcoin')$price_usd
eth=daily_market('ethereum')$price_usd
ltc=daily_market('litecoin')$price_usd
btcr=diff(log(btc))
ethr=diff(log(eth))
ltcr=diff(log(ltc))

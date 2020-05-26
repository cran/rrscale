## -----------------------------------------------------------------------------
set.seed(12345)
N = rpois(10,20)
data = lapply(N,rexp)
str(data)

## -----------------------------------------------------------------------------
library('rrscale')
rr.out = rrscale(data)

## -----------------------------------------------------------------------------
str(rr.out$RR)

## ---- out.width='100%', fig.asp=.5, dpi=300-----------------------------------
library('ggplot2')
library('reshape2')
par(mfrow=c(2,1))
df = data.frame(untrans=unlist(data),rr=unlist(rr.out$RR))
df = melt(df,measure.vars = 1:2)
ggplot(data=df,mapping=aes(x=value,fill=variable))+geom_histogram()+facet_wrap(~variable)

## -----------------------------------------------------------------------------
g_only = rr.out$rr(data,G=TRUE,Z=FALSE,O=FALSE)
str(g_only)


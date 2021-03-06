library("R.matlab")
setwd("C:/Users/ad/Desktop/guijitest1")
library(mgcv)      #加载mgcv软件包，因为gam函数在这个包里
Data <- read.csv("guiji1.csv", header = TRUE)
#查看Data数据：Data，查看第2列：Data[,2]，第2行：Data[2,]<br>
X<-Data[,3]
Y<-Data[,2]
result1 <- gam(Y ~ s(X))     #此时，Adult为相应变量，Day为解释变量

y_pred<-predict(result1)
pred<-data.frame( X=X,Y=y_pred)
write.csv(pred, "pred1.csv")
writeMat("jieguo2.mat",jieguo2=pred)
#画图
plot(result1,se=T,resid=T,pch=16)
par(new=TRUE)
summary(result1)      #输出计算结果
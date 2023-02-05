#pearson
x=c(21,23,30,54,57,58,72,78,87,90)
y=c(60,71,72,83,110,84,100,92,113,135)
z=cor.test(x,y,method="pearson")
print(z)

#pearson
x2=c(10,15,12,17,13,16,24,14,22)
y2=c(30,42,45,46,33,34,40,35,39)
z2=cor.test(x2,y2,method="spearman")
print(z2)

#tied ranks
x3=c(68,64,75,50,64,80,75,40,55,64)
y3=c(62,58,68,45,81,60,68,48,50,70)
z3=cor.test(x3,y3,method="kendall",exact=F)
print(z3)

#regression
x4=c(4.7,8.2,12.4,15.8,20.7,24.9,31.9,35.0,39.1,38.8)
y4=c(4.0,8.0,12.5,16.0,20.0,25.0,31.0,36.0,40.0,40.0)
fit=lm(x4~y4)#x on y
fit2=lm(y4~x4)#y on x
print(fit)
print(fit2)

#regression model
x5=c(30,40,20,50,60,40,20,60)
x6=c(11,10,7,15,19,12,8,14)
y5=c(110,80,70,120,150,90,70,120)
input_data=data.frame(y5,x5,x6)
RegModel=lm(y5~x5+x6,data=input_data)
print(RegModel)

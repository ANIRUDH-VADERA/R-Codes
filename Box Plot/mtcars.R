#ANIRUDH VADERA
#20BCE2940
attach(mtcars)
#BOXPLOT BETWEEN MPG AND TRANSMISSION TYPE
#CHECKING HOW MPG WILL CHANGE BASED ON TRANSMISSION TYPE
boxplot(mpg~am,data=mtcars,col=c("red","green"),xlab="Transmission",ylab="Miles per Gallon",main="MPG by Transmission Type ANIRUDH VADERA(20BCE2940)")
legend("bottomright",legend = c("0 Automatic","1 Manual"),fill=c("red","green"),title="Transmission Type")

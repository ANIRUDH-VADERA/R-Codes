#ANIRUDH VADERA
#20BCE2940
#Importing the data 
x <- read.csv("C:/Users/Anirudh/OneDrive/Desktop/covid_vaccine_statewise.csv",header=TRUE,sep=",")





#Derived Data

colnames(x) <- c("Date","State","Total.Individuals.Vaccinated","First.Dose","Second.Dose","Male","Female","Transgender","Total.Covaxin","Total.CoviShield","Total.Doses")
for(i in length(x$Date):2){
  x$Total.Individuals.Vaccinated[i]=x$Total.Individuals.Vaccinated[i]-x$Total.Individuals.Vaccinated[i-1]
  x$First.Dose[i]=x$First.Dose[i]-x$First.Dose[i-1]
  x$Second.Dose[i]=x$Second.Dose[i]-x$Second.Dose[i-1]
  x$Male[i]=x$Male[i]-x$Male[i-1]
  x$Female[i]=x$Female[i]-x$Female[i-1]
  x$Transgender[i]=x$Transgender[i]-x$Transgender[i-1]
  x$Total.Covaxin[i]=x$Total.Covaxin[i]-x$Total.Covaxin[i-1]
  x$Total.CoviShield[i]=x$Total.CoviShield[i]-x$Total.CoviShield[i-1]
  x$Total.Doses[i]=x$Total.Doses[i]-x$Total.Doses[i-1]
  
}

x$Total.Doses[length(x$Date)]=x$Total.Individuals.Vaccinated[length(x$Date)] #to complete the data

x=x[-1,]
rownames(x) = seq(length=nrow(x))
x$index=c(1:length(x$Date))



#Graphs

par(mar=c(13,6,3,1)+.1)
options(scipen = 999)
barplot(t(matrix(c(x$Total.Covaxin,x$Total.CoviShield),ncol=2)),legend = c("covaxin","covidshield"),names.arg = x$Date,cex.names = 0.5,las=2,ylab="Total Vaccines\n\n",main="Types of vaccines ANIRUDH VADERA 20BCE2940")
title(xlab="Dates",mgp=c(3,1,0))


par(mar=c(13,6,3,1)+.1)
options(scipen = 999)
barplot(t(matrix(c(x$Male,x$Female,x$Transgender),ncol=3)),legend = c("Male","Female","Transgender"),names.arg = x$Date,cex.names = 0.5,las=2,ylab="Total vaccinated\n\n",main="total vaccination per day based on gender ANIRUDH VADERA 20BCE2940")
title(xlab="Dates",mgp=c(3,1,0))


par(mar=c(13,6,3,1)+.1)
options(scipen = 999)
barplot(t(matrix(c(x$First.Dose,x$Second.Dose),ncol=2)),legend = c("First dose","second dose"),names.arg = x$Date,cex.names = 0.5,las=2,ylab="Total vaccinated\n\n",main="ANIRUDH VADERA 20BCE2940")
title(xlab="Dates",mgp=c(3,1,0))

#Analytics 

#Correlation matrix
print("Original Data")
head(x)

# computing correlation matrix
cor_data = cor(x$Total.CoviShield,x$Total.Covaxin,use = "complete.obs")

print("Correlation")
print(cor_data)

#Regression
lm(x$Total.Doses~x$index,data=x)
plot(x$Total.Doses~x$index,data=x)
abline(lm(x$Total.Doses~x$index,data=x))
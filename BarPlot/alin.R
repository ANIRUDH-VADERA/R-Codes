D<-c('2020-05-31','2020-06-01','2020-06-02','2020-06-03','2020-06-04','2020-06-05','2020-06-06','2020-06-07','2020-06-08','2020-06-09','2020-06-10','2020-06-11','2020-06-12','2020-06-13','2020-06-14')

noofcases<-c(182143,190535,198706,207615,216919,226770,236657,246628,256611,266598,276583,286579,297535,308993,320922)

noofdeaths<-c(5164,5394,5598,5815,6075,6348,6642,6929,7200,7471,7745,8102,8498,8884,9195)

recoveries<-c(86984,91819,95527,100303,104107,109462,114073,119293,124430,129314,135206,141029,147195,154330,162379)

types<-c("No. of Deaths","Recoveries","Active No. of cases")

active=noofcases-noofdeaths-recoveries
newnoofdeaths<-rev(noofdeaths)
newrecoveries<-rev(recoveries)
newactive<-rev(active)
D<-rev(D)

values = rbind(newnoofdeaths,newrecoveries,newactive)

col<-c("brown","lightblue","orange red")
barplot(values,names.arg=D,main="COVID-19 No. of Casesin India",xlab="Number of Cases",col=col,horiz=TRUE,las=1,axes=FALSE)
par(mar=c(4,6,6,7)+2)
legend(0.1,19.3,types,cex=1,fill=col,bty = "n",horiz=TRUE)
title(ylab = "Date", line = 0)  
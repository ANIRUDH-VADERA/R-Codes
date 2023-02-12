#anirudhvadera(20BCE2940)
dates<-c('2020-05-31','2020-06-01','2020-06-02','2020-06-03','2020-06-04','2020-06-05','2020-06-06','2020-06-07','2020-06-08','2020-06-09','2020-06-10','2020-06-11','2020-06-12','2020-06-13','2020-06-14')
no_of_cases<-c(182143,190535,198706,207615,216919,226770,236657,246628,256611,266598,276583,286579,297535,308993,320922)
no_of_deaths<-c(5164,5394,5598,5815,6075,6348,6642,6929,7200,7471,7745,8102,8498,8884,9195)
types<-c("Deaths","Recoveries","Active cases")
active_cases=no_of_cases-no_of_deaths-no_of_recoveries
values<-rbind(rev(no_of_deaths),rev(no_of_recoveries),rev(active_cases))
colors<-c("brown","blue","orange")
barplot(values,names.arg=rev(dates),main="COVID-19 cases in India",xlab="Number of cases",ylab="Date",col=colors,horiz=TRUE,las=1,axes=FALSE)
par(mar=c(5,4,4,8)+3)
legend("topleft",types,cex=1,fill=colors,bty = "n",horiz=TRUE)


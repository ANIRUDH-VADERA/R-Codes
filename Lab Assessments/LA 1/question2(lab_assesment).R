# QUESTION 2
#ANIRUDH VADERA
#20BCE2940
months_in_number <- c(6,7,8,9)
rain_in_2017 <- c(15,22,25,30)
rain_in_2018 <- c(16,20,19,25) 
rain_in_2019 <- c(17,15,18,20)

layout(matrix(c(1,2), 1, 2, byrow = TRUE))
opts = c("l","o")
length(opts)
for(i in 1:length(opts)){
  heading = paste("type=",opts[i])
  plot(months_in_number, rain_in_2017, type="n", xlab = "Month", ylab = "Rainfall in mm", main=heading)
  legend("bottomright",legend=c("2017","2018", "2019"), cex=0.6, col=c("red", "blue", "dark green"),lty=1:3)
  lines(month, rain_in_2017, type=opts[i],lty=1,col="red")
  lines(month, rain_in_2018, type=opts[i],lty=2,col="blue")
  lines(month, rain_in_2019, type=opts[i],lty=3,col="dark green")
}
mtext("ANIRUDH VADERA(20BCE2940)", side = 3, line = -1, outer = TRUE)
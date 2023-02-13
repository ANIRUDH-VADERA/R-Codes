#ANIRUDH VADERA
#20BCE2940

#IMPORTING THE DATA FROM A CSV FILE

data<-read.csv(file="C:/Users/Anirudh/OneDrive/Desktop/fortune1000.csv",header=TRUE,sep=",")

#CREATING A DATA FRAME

fortune_data = data.frame(data)

#FINDING THE UNIQUE SECTORS IN THE GIVEN DATA SET

uniqueSectors = unique(fortune_data$Sector)

#FINDING THE NUMBER OF COMPANIES IN EACH SECTOR

#All the unique sectors are stored in uniqueSectors array.
#Iterating through the array and printing the number of Companies in each sector
#Creating a temporary (LIST)array which will store all the companies related to a particular sector

for(sector in uniqueSectors)
{
  tempList <- fortune_data$Company[fortune_data$Sector == sector]
}

#Finding the top 5 sectors based on their total employee size

#Creating a Temporary Data Frame which will store data about each of the Top_5 Sector and its Total Employees
#We use dplyr package to use the group_by, summarize, top_n and arrange functions
#group_by(Sectors) : To group the data according to the Sectors
#summarize(TotalEmployees=sum(Employees)) : In order to provide a summary of No of total Employees in a particular Sector 
#and it also creates a variable TotalEmployee and stores the number of Employees for each sector in it
#top_n(5) : To select the top 5 Sectors based on the Total Employee Size
#arrange(desc(TotalEmployees)) : In order to arrange in descending order

library("dplyr")
Top_5_Sectors <- fortune_data %>% group_by(Sector) %>% summarise(TotalEmployees=sum(Employees)) %>% top_n(5) %>% arrange(desc(TotalEmployees))

#Finding the Top 10 Industries based on the Total Revenue

#Creating a Temporary Data Frame which will store data about each of the Top_10 Industries and their Total Revenue
#We use dplyr package to use the group_by, summarize, top_n and arrange functions
#group_by(Industry) : To group the data according to the Industry
#summarize(TotalRevenue=sum(Revenue)) : In order to provide a summary of Total Revenue in a particular Industry 
#and it also creates a variable Total_Revenue and stores the Total Revenue for each Industry in it
#top_n(10) : To select the top 10 Industries based on the Total Revenue
#arrange(desc(TotalRevenue)) : In order to arrange in descending order

library("dplyr")
Top_10_Industries <- fortune_data %>% group_by(Industry) %>% summarize(TotalRevenue=sum(Revenue)) %>% top_n(10) %>% arrange(desc(TotalRevenue))

#Bar chart for showing the revenue of top-20 Companies

#Creating a Temporary Data Frame which will store data about each of the Top_20 Companies and their Revenue
#We use dplyr package to use the group_by, summarize, top_n and arrange functions
#group_by(Company) : To group the data according to the Companies
#summarize(Revenue=sum(Revenue)) : In order to provide a summary of Revenue in a particular Company 
#and it also creates a variable Revenue and stores the Revenue for each Company in it
#top_n(20) : To select the top 20 Companies based on the Revenue
#arrange(desc(Revenue)) : In order to arrange in descending order

library("dplyr")
Top_20_Companies <- fortune_data %>% group_by(Company) %>% summarize(Revenue=sum(Revenue)) %>% top_n(20) %>% arrange(desc(Revenue))
#Plotting the Bar Chart

#options(scipen = 999) : For converting the scientific values to simple integral values 
#options(scipen = 999)
#par(mar=c(15,6,4,1)+.2) : For adjusting the graph +.2 is for the padding (15,6,4,1) respectively bottom , left , top and right.
#par(mar=c(12,6,4,1)+.2)
#The barplot command

#barplot(Top_20_Companies$Revenue, names.arg = Top_20_Companies$Company, xlab = "", ylab = "Revenue\n\n", 
#        main = "Top 20 Companies based on Revenue ANIRUDH VADERA(20BCE2940)", ylim = c(0,500000) ,
#        col = "darkorchid", border = "black", las = 2, cex.names = 1, col.main = "red", col.axis = "steelblue2")

#For giving the xlab separately in order to adjust the graph
#title(xlab="Company",mgp=c(10,1,0))





#Plotting the Scatterplot based on Revenue and Profit of the Top 20 Companies based on the Employee Size
#Using the employee number as the size of the circle

#Creating a Temporary Data Frame which will store data about each of the Top_20_Companies according to their EmployeeSize and their Revenue and Profit
#We use dplyr package to use the group_by, summarize, top_n and arrange functions
#group_by(Company) : To group the data according to the Companies
#summarize(Revenue=sum(Revenue), Profit=sum(Profits), TotalEmployees=sum(Employees), ) : In order to provide a summary of Revenue ,Profit and TotalEmployees in a particular Company 
#and it also creates the variables Revenue, Profit and TotalEmployees and stores the Revenue, Profit and Total number of employees for each Company in it
#top_n(20) : To select the top 20 Companies based on the TotalEmployees
#arrange(desc(TotalEmployees)) : In order to arrange in descending order

library("dplyr")

Top_20_Companies_Employee_Size <- fortune_data %>% 
  group_by(Company) %>% 
  summarize(Revenue=sum(Revenue), Profit=sum(Profits), TotalEmployees=sum(Employees), ) %>% 
  top_n(20) %>% 
  arrange(desc(TotalEmployees))
print(Top_20_Companies_Employee_Size)

#Attaching the dataframe Top_20_Companies_Employee_Size
attach(Top_20_Companies_Employee_Size)

#Creating a temporary array for storing the size of each circle for a particular company 
circleSize <- rep(0,times=20)
#This variable idx is the particular index of the circleSize array
idx <- 1
for(item in TotalEmployees)
{
  #Using the Employee size as the circleSize of a particular Company and storing it in the circleSize array
  #We use relative sizing here each circle will have a percent of size as a whole
  circleSize[idx] = (item/sum(TotalEmployees))*50
  #As we stored a particular value above in our array we increase the index now
  idx = idx + 1
}

#options(scipen = 999) : For converting the scientific values to simple integral values 
options(scipen = 999)

#The Scatterplot
#The cex command here is for the circleSize
plot(Revenue, Profit, main = "Scatterplot based on Revenue and Profit of the Top 20 Companies according to Employee Size ANIRUDH VADERA(20BCE2940)", xlab = "Revenue", 
     ylab="Profit", axes = TRUE, pch = 19,  col = "steelblue2", col.main = "red", col.axis = "blue", xlim = c(0,6e+5) , col.lab = "green", fg="grey", cex = circleSize)


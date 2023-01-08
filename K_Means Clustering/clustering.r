#Kmeans Clustering
library("ggfortify")
summary(iris)
head(iris)
data = iris[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]
data
kmean = kmeans(data,3)
kmean$centers
autoplot(kmean,data,frame=TRUE)

#Hierarchail Clustering 
# library(dplyr)
# head(mtcars)
# distance_mat = dist(mtcars,method = "euclidean")
# distance_mat
# 
# #Fitting Hierarchial clustering model to training dataset
# set.seed(240)
# Hierar_cl = hclust(distance_mat,method = "average")
# Hierar_cl
# 
# #Plotting dendrogram
# plot(Hierar_cl)
# 
# #Choosing no. of clusters
# #Cutting tree by height
# abline(h=110,col="green")
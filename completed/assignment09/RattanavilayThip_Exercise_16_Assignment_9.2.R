# Assignment: Exercise 16 Assignment 9.2
# Name: Rattanavilay, Thip
# Date: 2/12/2021

library(FNN)
library(ggplot2)
library(philentropy)
library(VIM)
library(ggpubr)
library(factoextra)


# Get housing data from local file and load into a R data frame
setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/")

datasetcluster_df<- read.csv("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/data/clustering-data.csv")
head(datasetcluster_df)



# A. Plot the dataset using a scatter plot.

plot(datasetcluster_df)
ggplot(datasetcluster_df, aes(x= x, y= y)) + geom_point( )+
  labs(title= "X vs Y", x="X", y="Y")

# B. Fit the dataset using the k-means algorithm from k=2 to k=12. Create a scatter plot of the resultant clusters for each value of k.


aggr(datasetcluster_df)

cluster2 <- kmeans(datasetcluster_df[, 1:2], 2)
cluster2

cluster3 <- kmeans(datasetcluster_df[, 1:2],3 )
cluster3

cluster4 <- kmeans(datasetcluster_df[, 1:2],4 )
cluster4

cluster5 <- kmeans(datasetcluster_df[, 1:2],5 )
cluster5

cluster6 <- kmeans(datasetcluster_df[, 1:2],6 )
cluster6

cluster7 <- kmeans(datasetcluster_df[, 1:2],7 )
cluster7

cluster8 <- kmeans(datasetcluster_df[, 1:2],8 )
cluster8

cluster9 <- kmeans(datasetcluster_df[, 1:2],9 )
cluster9

cluster10 <- kmeans(datasetcluster_df[, 1:2],10)
cluster10

cluster11 <- kmeans(datasetcluster_df[, 1:2],11 )
cluster11

cluster12 <- kmeans(datasetcluster_df[, 1:2],12 )
cluster12

## fviz_cluster

fviz_cluster(cluster2, data= datasetcluster_df[, -100],
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster3, data= datasetcluster_df[, -100],
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster4, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster5, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster6, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster7, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster8, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster9, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster10, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster11, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())

fviz_cluster(cluster12, data= datasetcluster_df[, -100],
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw())


# C. As k-means is an unsupervised algorithm, you cannot compute the accuracy as there are no correct values to compare the output to. Instead, 
#   you will use the average distance from the center of each cluster as a measure of how well the model fits the data. To calculate this metric, 
#   simply compute the distance of each data point to the center of the cluster it is assigned to and take the average value of all of those distances.


distance2<-distance(cluster2$centers, method = "euclidean")
distance2

distance3<-distance(cluster3$centers, method = "euclidean")
distance3

distance4<-distance(cluster4$centers, method = "euclidean")
distance4

distance5<-distance(cluster5$centers, method = "euclidean")
distance5

distance6<-distance(cluster6$centers, method = "euclidean")
distance6

distance7<-distance(cluster7$centers, method = "euclidean")
distance7

distance8<-distance(cluster8$centers, method = "euclidean")
distance8

distance9<-distance(cluster9$centers, method = "euclidean")
distance9

distance10<-distance(cluster10$centers, method = "euclidean")
distance10

distance11<- distance(cluster11$centers, method = "euclidean")
distance11

distance12<- distance(cluster12$centers, method = "euclidean")
distance12

mean2<- mean(distance2)
mean2

mean3<- mean(distance3)
mean3

mean4<- mean(distance4)
mean4

mean5<- mean(distance5)
mean5

mean6<- mean(distance6)
mean6

mean7<- mean(distance7)
mean7

mean8<- mean(distance8)
mean8

mean9<- mean(distance9)
mean9

mean10<- mean(distance10)
mean10

mean11<- mean(distance11)
mean11

mean12<- mean(distance12)
mean12

averagedf<- data.frame('k' = 2:12, 
                       'means'= c(mean2, 
                                  mean3, 
                                  mean4, 
                                  mean5,
                                  mean6, 
                                  mean7, 
                                  mean8, 
                                  mean9, 
                                  mean10, 
                                  mean11, 
                                  mean12))

ggplot(averagedf,aes(x=k, y=means)) +geom_line()

averagedf

#Looking at the graph creating the elbow point would be where k=3 and the average distance is around 88.69. This is where the graph changes shape and has an inflection point. 
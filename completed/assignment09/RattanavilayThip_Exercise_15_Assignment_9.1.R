# Assignment: Exercise 15 Assignment 9.1
# Name: Rattanavilay, Thip
# Date: 2/12/2021


library(FNN)
library(ggplot2)


# Get housing data from local file and load into a R data frame
setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/")
datasetcluster_df<- read.csv("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/data/clustering-data.csv")
head(datasetcluster_df)
#  Introduction to Machine Learning


# A.  Plot the data from each dataset using a scatter plot

plot(binary_df$x, binary_df$y)
ggplot( binary_df, aes(x= x, y= y)) + geom_point( )+
  labs(title= "X vs Y", x="X", y="Y")

plot(trinary_df$x, trinary_df$y)
ggplot( trinary_df, aes(x= x, y= y)) + geom_point( )+
  labs(title= "X vs Y", x="X", y="Y")


# B. The k nearest neighbors algorithm categorizes an input value by looking at the labels for the k nearest points and assigning a 
# category based on the most common label. In this problem, you will determine which points are nearest by calculating the Euclidean 
# distance between two points. As a refresher, the Euclidean distance between two points:

# and

# is

# The k nearest neighbors algorithm categorizes an input value by looking at the labels for the k nearest points and assigning a 
# category based on the most common label. In this problem, you will determine which points are nearest by calculating the Euclidean 
# distance between two points. As a refresher, the Euclidean distance between two points:

normalize <-function(x) { (x -min(x))/(max(x)-min(x))   }
binary_norm <- as.data.frame(lapply(binary_df[,c(2:3)],normalize))
head(binary_norm)

data_split <- sample(1:nrow(binary_norm), .8 * nrow(binary_norm))
train<- binary_norm[data_split,]
head(train)
dim(train)

test<- binary_norm[-data_split,]

target_category<-binary_df[data_split, 2]
test_category<- binary_df[-data_split, 2]

target_category
test_category

binary3<- knn(train, test,cl=target_category, k=3)
binary3

binary5<- knn(train, test,cl=target_category, k=5)
binary5

binary10<- knn(train, test,cl=target_category, k=10)
binary10

binary15<- knn(train, test,cl=target_category, k=15)
binary15

binary20<- knn(train, test,cl=target_category, k=20)
binary20

binary25<- knn(train, test,cl=target_category, k=25)
binary25

tri_norm <- as.data.frame(lapply(trinary_df[,c(2:3)],normalize))
head(tri_norm)

data_split <- sample(1:nrow(tri_norm), .8 * nrow(tri_norm))
train2<- tri_norm[data_split,]
head(train2)
dim(train2)

test2<- tri_norm[-data_split,]

target_category1<-trinary_df[data_split, 3]
test_category1<- trinary_df[-data_split, 3]

target_category1
test_category1

tri3<- knn(train2, test2,cl=target_category1, k=3)
tri3

tri5<- knn(train2, test2,cl=target_category1, k=5)
tri5

tri10<- knn(train2, test2,cl=target_category1, k=10)
tri10

tri15<- knn(train2, test2,cl=target_category1, k=15)
tri15

tri20<- knn(train2, test2,cl=target_category1, k=20)
tri20

tri25<- knn(train2, test2,cl=target_category1, k=25)
tri25



# C. In later lessons, you will learn about linear classifiers. These algorithms work by defining a decision boundary that separates the different categories.
# Looking back at the plots of the data, do you think a linear classifier would work well on these datasets?

# I believe that linear classifiers would work for both the binary and trinary plots.
# Looking at the data plotted it shows that there would be success using the linear classifiers.
# Through my understanding these plots would work with a linear type model.



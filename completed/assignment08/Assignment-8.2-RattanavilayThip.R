# Assignment: Exercise 14 Assignment 8.2
# Name: Rattanavilay, Thip
# Date: 2021-01-30

library("foreign")
library("caTools")
library(ggplot2)

# Get housing data from local file and load into a R data frame

setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/completed/assignment08")
data <- read.csv("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/completed/assignment08/binary-classifier-data.csv")

# Dataset 8.2

# Fit a Logistic Regression Model to Previous Dataset


## A. What is the accuracy of the logistic regression classifier?

# 57.5%


# Split the data into training and validation data sets
split <- sample.split(data, SplitRatio = 0.8)
split
train <- subset(data, split == "TRUE")
validate <- subset(data, split == "FALSE")

# Train model using training data set
lgm8.2 <- glm(label ~ x +y, data = train, family = binomial())
summary(lgm8.2)

# Run validation data through the model built on training data
res <- predict(lgm8.2, validate, type = "response")
res
res2 <-predict(lgm8.2, train, type = "response")
res2

#Validate model using confusion matrix
confmatrix <- table(Actual_Value=train$label, Predicted_Value = res2 >0.5)
confmatrix

#Accuracy
(confmatrix[[1,1]] + confmatrix[[2,2]])/sum(confmatrix)

## B. How does the accuracy of the logistic regression classifier compare to the nearest neighbors algorithm?

# The accuracy for the nearest neighbors seemed much higher than the logistic regression accuracy.


##Generate a random number that is 90% of the total number of rows in dataset.
ran <- sample(1:nrow(data), 0.9 * nrow(data)) 

##the normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run nomalization on the last 2 columns of dataset because they are the predictors
knn_norm <- as.data.frame(lapply(data[,c(2,3)], nor))
summary(knn_norm)

##extract training set
knn_train <- knn_norm[ran,] 

##extract testing set
knn_test <- knn_norm[-ran,] 

##extract 1st column of train dataset because it will be used as 'cl' argument in knn function.
knn_target_category <- data[ran,1]

##extract 1st column if test dataset to measure the accuracy
knn_test_category <- data[-ran,1]

##load the package class
library(class)

##run knn function
pr <- knn(knn_train,knn_test,cl=knn_target_category,k=5)

##create confusion matrix
tab <- table(pr,knn_test_category)

##this function divides the correct predictions by total number of predictions that tell us how accurate the model is.
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)


## C. Why is the accuracy of the logistic regression classifier different from that of the nearest neighbors?

# Logistic regression works better with linear relationships, and by looking at the plot below, you can see there is a non-linear relationship between the data and the predictor.

data_space <-ggplot(data, aes(x = x, y = y, col = label)) + 
  geom_point()
data_space +
  geom_smooth(method = "glm", se = FALSE)


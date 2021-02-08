# Assignment: Exercise 13 Assignment 8.1
# Name: Rattanavilay, Thip
# Date: 2021-01-30


library("foreign")
library("caTools")
library(ggplot2)


# Get housing data from local file and load into a R data frame
setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/completed/assignment08")
data <- read.arff("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520/completed/assignment08/ThoraricSurgery.arff")


# Dataset 8.1
# Fit a Logistic Regression Model to the Thoracic Surgery Binary Dataset

# A.  Fit a binary logistic regression model to the data set that predicts whether or not the patient survived for one year (the Risk1Y variable) after the surgery. Use the glm() function to perform the logistic regression. See Generalized Linear Models for an example. Include a summary using the summary() function in your results.

#Logistic Regression
lgm1 <- glm(Risk1Yr ~ DGN + PRE4 + PRE5 + PRE6 + 
              PRE7 + PRE8 + PRE9 + PRE10 + PRE11 + 
              PRE14 + PRE17 + PRE19 + PRE25 + PRE30 + 
              PRE32 + AGE, data = data, family = binomial()  )
summary(lgm1)


# B. According to the summary, which variables had the greatest effect on the survival rate?

# PRE9T, PRE14OC14, pRE17T, PRE30T all had significant values, hence the greatest effect on survival rate.

# C. To compute the accuracy of your model, use the dataset to predict the outcome variable. The percent of correct predictions is the accuracy of your model. What is the accuracy of your model?

# 88.6%

# Split the data into training and validation data sets
split <- sample.split(data, SplitRatio = 0.8)
split
train <- subset(data, split == "TRUE")
validate <- subset(data, split == "FALSE")

# Train model using training data set
lgm2 <- glm(Risk1Yr ~ DGN + PRE4 + PRE5 + PRE6 + 
              PRE7 + PRE8 + PRE9 + PRE10 + PRE11 + 
              PRE14 + PRE17 + PRE19 + PRE25 + PRE30 + 
              PRE32 + AGE, data = train, family = binomial()  )
summary(lgm2)

# Run validation data through the model built on training data
res <- predict(lgm2, validate, type = "response")
res
res2 <-predict(lgm2, train, type = "response")
res2

#Validate model using confusion matrix
confmatrix <- table(Actual_Value=train$Risk1Yr, Predicted_Value = res2 >0.5)
confmatrix

#Accuracy
(confmatrix[[1,1]] + confmatrix[[2,2]])/sum(confmatrix)




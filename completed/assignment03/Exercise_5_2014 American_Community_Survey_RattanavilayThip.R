# Assignment: Exercise 5: 2014 American Community Survey
# Name: Rattanavilay, Thip
# Date: 2020-12-16

## Load the ggplot2 package
library(ggplot2)

## Load pastecs, psych, moments
library(pastecs)
library(psych)
library(moments)

## Set Theme
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
getwd()
setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520")

## Load the `data/r4ds/heights.csv` to
HSDdata <- read.csv("data/acs-14-1yr-s0201.csv", header = TRUE, sep = ",")

#1. What are the elements in your data (including the categories and data types)?
#Answer: There is 1 dataframe  and 2 factors as our data types. 136 observations and 8 variables

# Variables:
#   Id: Quantitative
#   Id2: Quantitative
#   Geography: Categorical
#   PopGroupID: Quantative
#   POPGROUP.display-label: Categorical 
#   RacesReported:Quantitative
#   HSDegree: Quantitative
#   BachDegree: Quantitative

#2. Please provide the output from the following functions: str(); nrow(); ncol()
str(HSDdata)
nrow(HSDdata)
ncol(HSDdata)

#3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#3a- Set a bin size for the Histogram.
#3b - Include a Title and appropriate X/Y axis labels on your Histogram Plot.

histo <- ggplot(HSDdata, aes(x = HSDegree)) + 
  geom_histogram(aes(y = ..density..),binwidth = 2) + 
  ggtitle("High School Degrees") + xlab("Degrees") + 
  ylab("Number of Degrees")
histo

# 4. Answer the following questions based on the Histogram produced:
#4a - I would say this is unimodal because there is really one noticeable hump in the data near the 90% mark
#4b - This is not symmetric as there is more data on the left side of the peak than on the rights side
#4c - I would not consider this bell shaped as the data is mostly peaked on the far right side so there is not an even bell curve on either side of the peak
#4d - Normal distribution can resemble the bell shape as well. I wouldn't consider this normal because we have tight distribution between the 85-95% range with several outliers below that 85% mark
#4e - I think the data is skewed. We have a high population at the top percentage, but lots of outliers below the 85% mark with some sitting at 65%
#4g - Normal distribution cannot be used for this as we have a high percentage of the population that have their HS Degree. In order for it to be normal we would expect to have an even amount of distribution on either side of the peak or mean.

avg <- mean(HSDdata$HSDegree)
med <- median(HSDdata$HSDegree)
avg
med

histo <- histo + stat_function(fun = dnorm, color = "red", args=list(mean=mean(HSDdata$HSDegree, na.rm = TRUE), sd=sd(HSDdata$HSDegree, na.rm = TRUE)))
histo



#5. Create a Probability Plot of the HSDegree variable.
probplt <-qqnorm(HSDdata$HSDegree)
probline <- qqline(HSDdata$HSDegree)
probline
probplt



#6. Answer the following questions based on the Probability Plot:
#Answers:
#6a- Based on "Discovering Statistics Using R" this probability plot is not normal because it's not at an incline. It has a noticeable curve to it.
#6b-  This plot is skewed to the left because it has the upward curve in the line. 

#7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
# See attached word doc for screen capture and results
stat.desc(HSDdata)
stat.desc(HSDdata$HSDegree)

quan_norm <- stat.desc(HSDdata)
quan_norm

#8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
#Answer:
# The average percent of the population to have completed their HS Degree is 88%. Out data is actually skewed to the left of the mean based on the calculated normality. The kurtosis is telling us that this isn't a normal distribution because the numbers are farther from 0, which would represent our normal distribution. 


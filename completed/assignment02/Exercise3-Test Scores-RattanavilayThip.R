# Exercise 3: Test Scores
# Name: Rattanavilay, Thip
# Date: 2020-12-12


# 1. What are the observational units in this study?

# Answer: 
#        The Observational units are the students. Students are asked for their Sections and scores vs grades.

# 2. Identify the variables mentioned in the narrative paragraph and 
#    determine which are categorical and quantitative?

# Answers: 
#         The variables are the students in the course and the content taught. The
#         students are categorical variables and the grades are quantitative variables.

# Add Library
library(readxl)
library(ggplot2)

# returns an absolute file path representing the current working directory of the R process
getwd()

#function returns a character vector of file and/or folder names within a directory.
dir()

# setwd() in r - change working directory
setwd("/Users/trattanavilay/Documents/BU-Data_SC_Master/DSC520-Statistics-for-Data-Science/dsc520")

# Assigned variable 'score_dr' and read csv file with path data/scores.csv
scores_df <- read.csv("data/scores.csv")
scores_df

count<- scores_df[,c(1)]
grades <- scores_df[,c(2)]
section <- scores_df[,c(3)]
print(section)


# 3. Create one variable to hold a subset of your data set that contains 
#    only the Regular Section and one variable for the Sports Section.
regular_section <- subset(scores_df,section == "Regular") 
print(regular_section)

sports_section <- subset(scores_df, section == "Sports")
print(sports_section)
table(scores_df$Section)

# 4. Use the Plot function to plot each Sections scores and the number of 
# students achieving that score. Use additional Plot Arguments to label the graph
# and give each axis an appropriate label.

ggplot(scores_df,aes(count, grades)) +
   geom_point(aes(color = section)) + 
   labs(title = "Student Section Comparison",
        subtitle = "Sports Section vs Regular Section" , 
        caption = "Scores Data")



ggplot(scores_df,aes(count, grades)) +
   geom_point(aes(color = section), position = "jitter", size = 5, shape = 16) + 
   labs(title = "Student Section Comparison",
        subtitle = "Sports Section vs Regular Section" , 
        caption = "Scores Data")

#  Once you have produced your Plots answer the following questions:
#
# A. Comparing and contrasting the point distributions between the two section,
#    looking at both tendency and consistency: Can you say that one section
#    tended to score more points than the other? Justify and explain your answer.

# Answer: 
#         The sports section had slightly more variety in scores than the regular
#         section (sports had 19 different scores and regular had 17 different
#         scores). It also had a wider range of scores (sports range = 200 - 395;
#         regular range = 265 - 380).
#
#         However, the average score for students in the regular section is higher.
#         This can be seen in the fact that 260 students scored 300 or higher in
#         the regular section, while only 220 students scored 320 or higher in
#         the sports section. (Scoring 300-400 points would be the upper quartile
#         of the data if we assume the range is 0-400 possible points). (Note that
#         there seemed to be duplicate rows in the data for the regular section
#         which could cause errors in analysis.)

# B. Did every student in one section score more points than every student in the
#    other section? If not, explain what a statistical tendency means in this context.

# Answer: 
#         Neither section had every student score more points then every student
#         in the other section. In this context, the statistical tendency would most
#         likely be the mode (the most frequent score in each section). For the
#         sports section, the mode was 285 and 335 (both had 30 students with
#         those scores). The regular section mode was 350 (30 students).

# B. What could be one additional variable that was not mentioned in the narrative
#    that could be influencing the point distributions between the two sections?

# Answer: 
#         Another variable that could be influencing the point distribution may be
#         a demographic difference between the two sections. It is stated that the
#         sports-themed section was advertised as such to the students prior to
#         registration. It is possible that the students who were more likely to
#         pick a sports-themed class would score differently on average than their
#         their counterparts, particularly when only given sports examples. It is
#         also possible that the students who specifically chose NOT to register
#         for a sports-themed class would be influenced differently by a more
#         diverse teaching method.
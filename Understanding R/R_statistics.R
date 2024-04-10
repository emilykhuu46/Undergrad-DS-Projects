# Question 1

stats<-read.csv("data.csv")
View(stats)

# Question 2

summary(stats)

# Question 3

stats2<-stats$Age
stats2

# Question 4

names(stats)

filtered_stats<-stats[stats$Age>=25,]
View(filtered_stats)

# Question 5

mean(stats$Income)

# Question 6

library(psych)
describe(stats$HoursWorkedPerWeek)

# Question 7

library(e1071)
require(e1071)

skewness(stats$Weight_kg)

kurtosis(stats$Weight_kg)

# Question 8 

library(dplyr)

stats2<- stats%>% mutate(LogIncome=log(stats$Income))
View(stats2)

# Question 9

names(stats)
stats3<-stats %>% mutate(JobSatisfaction = cut(JobSatisfaction,
                                               breaks = c(0, 3, 7, 10),
                                               labels = c("Low", "Medium", "High"),
                                               include.lowest = TRUE))
View(stats3)

# Question 10

df<-stats[order(-stats$Age),]
View(df)

# Question 11

names(stats)

filter(stats, HoursWorkedPerWeek>40, Country=="USA")

# Question 12

arrange(stats, desc(Income))

# Question 13

f1<- select(stats, ID, Age, Gender)
View(f1)

# Question 14

names(stats)

Height_m<- stats$Height_cm/100

mutate(stats, BMI=Weight_kg/Height_m^2)

# Question 15

library(forcats)

df2<-stats %>% mutate(Gender=ifelse(Gender == "Female", 0, 1))

View(df2)

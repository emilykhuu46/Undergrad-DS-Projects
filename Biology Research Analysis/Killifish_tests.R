df<- read.csv("cleaned_kilifish_data.csv")
head(df)
names(df)

# chi squared test

#ho= there is not a relationship between population and grouping behavior
#ha= there is a relationship between population and grouping behavior

cont_table <- table(df$Grouping, df$Population)
chi_sq_test <- chisq.test(cont_table)
chi_sq_test

#x squared is 38.817 which compared to the df of 1 means that the critical value is 3.84
# 38.817 > 3.84 indicates that we reject the ho.

#p value is 0.0000000004654 < 0.05 which indicates this has likely not occured by chance and we reject the ho.


#-----------------------------------------
#next is t-test?

#grouping between ko and hp?


#---------------------------------------
#ANOVA for full dataset
model <- aov(df$Grouping ~ df$Experiment.Water + df$River + df$Population + df$N + df$Location + df$Total + df$Percentage + df$Trial.ID, data = df)

summary(model)


#river pop vs experiment water
model_pop <- aov(df$Grouping ~ df$Population + df$Experiment.Water, data = df)

summary(model_pop)


#Location 
df$Location <- factor(df$Location)

model_loc <- aov(df$Grouping ~ df$Location, data = df)

# Summarize the ANOVA results
summary(model_loc)


#------------------------------------------------------

#check the var/mean 

data<- read.csv('killifish_mean_variance_results.csv')
head(data)
names(data)

t_test_result <- t.test(data$Result, mu = 0)

print(t_test_result)

#the mean lies within the interval of 2.096 and 3.642 and is significantly diff from 0
#therefore confirming that on average, grouping is occurring.
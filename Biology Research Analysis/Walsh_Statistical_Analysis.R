Title: "WALSH LAB - DATA RESULTS"
Author: "Mariah Noelle Cornelio Emily Hong An Khuu & Mariah Noelle Cornelio"
Date: "2-Apr-2024"
Output: "Statistical Results"


# NOTE: H0 will be rejected if the p-value is less than a = 0.05!
# Download packages and datasets 
setwd("/Users/marielle/Desktop/Walsh Trials")
data <- read.csv("cleaned_kilifish_data.csv")

## Chi squared test to test for relationship between Population and Grouping
# Null Hypothesis (H0): There is no relationship between Population and Grouping.
# Alternative Hypothesis (HA): There is a relationship between Population and Grouping.
str(data)
chisq_result <- chisq.test(data$Population, data$Grouping)
print(chisq_result)

chi_summary<-summary(chisq_result)
chi_table<-chi_summary

chi_df<-as.data.frame(chi_table)

write.csv(chi_df, file='chi_test_grouping_pop.csv')
## Chi squared test to test for relationship between River and Grouping
# Null Hypothesis (H0): There is no relationship between River and Grouping.
# Alternative Hypothesis (HA): There is a relationship between River and Grouping.
cross_table <- table(data$River, data$Grouping)
chi_square_result <- chisq.test(cross_table)
print(chi_square_result)

chi_table <- table(data$Experiment.Water, data$Grouping)
chi_square_result_ew <- chisq.test(chi_table)
print(chi_square_result_ew)

## ANOVA Tests
# Using '+' focuses on the main effects of variables independently.
# Using '*' considers the combined effects and potential interactions between variables.
# In ANOVA models, choosing between '+' and '' depends on the research question and whether you are interested in examining interaction effects between variables. If you suspect that variables may interact with each other, including terms with '' is appropriate. Otherwise, using '+' may suffice to examine the main effects of variables independently.

### Random combinations - look for p-values that are less than alpha ( p < 0.05 ) which rejects the H0 that says that there is a difference between variables 
# Perform ANOVA for Location and Grouping
anova_location_grouping <- aov(Total ~ Location * Grouping, data = data)
print(summary(anova_location_grouping))

# Perform ANOVA for Location and Population
anova_location_population <- aov(Total ~ Location * Population, data = data)
print(summary(anova_location_population))

# Perform ANOVA for Location and River
anova_location_river <- aov(Total ~ Location * River, data = data)
print(summary(anova_location_river))

# Perform ANOVA for Grouping and Population - THIS ONE 
anova_result <- aov(Grouping ~ Population, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and River
anova_result <- aov(Grouping ~ River, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Experiment Water - THIS ONE
anova_result <- aov(Grouping ~ Experiment_Water, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Location
anova_result <- aov(Grouping ~ Location, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Totals
anova_result <- aov(Grouping ~ Total, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and N - THIS ONE
anova_result <- aov(Grouping ~ N, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Population with Total into Account 
anova_result <- aov(Grouping ~ Population * Total, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and River with Total into Account
anova_result <- aov(Grouping ~ River * Total, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Experiment Water with Total into Account
anova_result <- aov(Grouping ~ Experiment_Water * Total, data = data)
print(summary(anova_result))

### WITH + SIGNS
anova_location_grouping <- aov(Total ~ Location + Grouping, data = data)
print(summary(anova_location_grouping))

# Perform ANOVA for Location and Population
anova_location_population <- aov(Total ~ Location + Population, data = data)
print(summary(anova_location_population))

# Perform ANOVA for Location and River
anova_location_river <- aov(Total ~ Location + River, data = data)
print(summary(anova_location_river))

# Perform ANOVA for Grouping and Population with Total into Account 
anova_result <- aov(Grouping ~ Population + Total, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and River with Total into Account
anova_result <- aov(Grouping ~ River + Total, data = data)
print(summary(anova_result))

# Perform ANOVA for Grouping and Experiment Water with Total into Account
anova_result <- aov(Grouping ~ Experiment_Water + Total, data = data)
print(summary(anova_result))

### Answering the Research Question "the population and/or river of these killifish affect their grouping behavior"
# Perform ANOVA for Grouping and Population
# Null Hypothesis (H0): There is no significant difference in the mean 'Grouping' behavior among different populations ('Population' variable).
# Alternative Hypothesis (Ha): There is a significant difference in the mean 'Grouping' behavior among different populations ('Population' variable).
anova_population <- aov(Grouping ~ Population, data = data)
print("ANOVA for Grouping and Population:")
print(summary(anova_population))

# Perform ANOVA for Grouping and River
anova_river <- aov(Grouping ~ River, data = data)
print("ANOVA for Grouping and River:")
print(summary(anova_river))

# Perform ANOVA for Grouping and the interaction between Population and River
# Null Hypothesis (H0): The effect of 'Population' on 'Grouping' behavior is the same across all levels of 'River' (no interaction effect).
# Alternative Hypothesis (Ha): The effect of 'Population' on 'Grouping' behavior varies across different levels of 'River' (interaction effect).
anova_interaction <- aov(Grouping ~ Population * River, data = data)
print("ANOVA for Grouping and the interaction between Population and River:")
print(summary(anova_interaction))


anova_result_int <- aov(Grouping ~ Population * Total * River, data = data)
print(summary(anova_result_int))

anova_result_int_loc <- aov(Grouping ~ Population * Total * River * Location, data = data)
print(summary(anova_result_int_loc))
#----------------------------------------------------------------------------------------
#check the var/mean 

df<- read.csv('killifish_mean_variance_results.csv')

t_test_result <- t.test(df$Result, mu = 0)

print(t_test_result)

#the mean lies within the interval of 2.096 and 3.642 and is significantly diff from 0
#therefore confirming that on average, grouping is occurring.

#add in another term like location to see additional fixed effect 
#graph the variance between ko and hp 

#talk about brain size in discussion 

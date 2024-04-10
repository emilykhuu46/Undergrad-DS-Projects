# Question 1 

df <- read.csv("house_price.csv")
head(df)
names(df)

library(ggplot2)

p<- ggplot(data=df, aes(x = Size_sqm, y = Price, color = Location))
p+geom_point(aes(colour=Location))

# Question 2
p1<- ggplot(data=df, aes(x = Age_years, y = Price, color = Location))
p1+geom_point(aes(colour=Location))+geom_smooth(method = "lm", se = FALSE, color = "red", size = 0.8)

# It appears that age has a slightly negative relationship with price. The older the house the less the house price it. However there is not a strong linear relationship. 

# Question 3

p+geom_point(colour="DarkGreen", size=3.5)+theme_bw()

# Question 5

x<- ggplot(data=df, aes(x=Price))
x+geom_histogram(binwidth = 10000)

# Question 6

y<- ggplot(data=df, aes(x=Size_sqm))
y+geom_histogram(binwidth = 10)
y+geom_density(aes(fill="red"))

# Question 8

ggplot(data=df)+geom_point(aes(x=Size_sqm, y=Price, color=Location))+
  facet_wrap(~Location)

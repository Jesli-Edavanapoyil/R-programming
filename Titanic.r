data1 = read.csv("titanic.csv")

# Subsetting problem
survive <- data1[which(data1$Survived==1 & data1$Age >= 40 &  data1$Sex=="male"),]
survive <- data1[data1$Survived==1 & data1$Age >= 40 &  data1$Sex=="male",]

Na <- data1[which(is.na(data1$Age)),]
# Na <- data1[is.na(data1$Age),]



X <- matrix(rnorm(30), nrow=5, ncol=6)
apply(X,1,sum)
apply(X,2,sum)
apply(X,2, function(z) sum(is.na(z))  )

# apply(data1,2,function(z) sum(is.na(z)) )
function(z)
{
  sum(is.na(z))
}


X <- data1[,c(1,2,3,6)]
lapply(X ,sum)
lapply(X ,function(x) sum(x,na.rm = T))
lapply(X, function(x) sum(is.na(x))  )

sum(X$Age,na.rm = TRUE)

sapply(1:3, function(z) z^2)
lapply(1:3, function(z) z^2)
sapply(1:3, function(z) z^2, simplify=F)
unlist(lapply(1:3, function(z) z^2))

data1$sqr <- data1$PassengerId * data1$PassengerId

data1$test <- sapply(data1$PassengerId,function(x) x^2 )

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
lapply(x, mean)





# Business analytics project phases
# Problem understanding
# Hypothesis building
# Data availability
# Data understanding - DI DQ, EDA, Data dictionary
# Solution construct
# Dependant variable creation 
# Data preparation - Merging / Roll ups
# Feature engg
# Missing value
# Outlier
# Model iteration










# Data Exploration

summary(data1)
# discussion of quartiles

# install.packages("Hmisc")
# install.packages("backports")
# library("Hmisc")
# describe(data1)

# To find missing values in data frames
apply(data1, 2, function(x) sum(is.na(x)))
apply(data1, 2, function(x) sum(is.na(x))  /  nrow(data1))*100


# missing values for colums
sum(is.na(data1$Age))/nrow(data1)
# why is it important to understand missing values percentages

# basic enquiry about numerical data
mean(data1$Age)
mean(data1$Age,na.rm = TRUE)


var(data1$Age)
var(data1$Age,na.rm = TRUE)


sd(data1$Age)
sd(data1$Age,na.rm = TRUE)





# list of unique value
unique(data1$Pclass)
# of unique values
length(unique(data1$Pclass))
# count(unique(data1$Pclass.tobe))

data("mtcars")
aggregate(mpg ~cyl,data=mtcars,mean)
aggregate(hp~gear,data=mtcars,sd)
aggregate(hp~gear,data=mtcars,mean)


# Quantile distribution
quantile(data1$Age,na.rm = TRUE)
quantile(data1$Fare,na.rm = TRUE)

# Outlier identification
quantile(data1$Fare, c(.07,.32, .57,.95, .98,.99,.995,1)  ,na.rm = TRUE) 
quantile(data1$Age, c(.32, .57, .98,.99,1),na.rm = TRUE) 


# x <- c(1,2,3,45,46,46,51,2002,45,47,50)
# quantile(x, c(.32, .57, .98, .99,1),na.rm = TRUE) 



# IQR understanding
# Inter Quartile Range
IQR(mtcars$mpg)
quantile(mtcars$mpg,na.rm = TRUE)



# Frequency of character column
table(data1$Survived)
table(data1$Sex)
table(data1$Age)

table(data1$Survived,data1$Sex)

# count of missing values as well
table(data1$Age,useNA='always')

# converting table output to data frame
x <- as.data.frame(table(data1$Age,useNA='always'))
y <- as.data.frame(table(data1$Age))

sum(x$Freq)


# Replace missing values by mean
data1$Age[which(is.na(data1$Age))] <- mean(data1$Age,na.rm = TRUE)
data1$Age[which(is.na(data1$Age))] <- 100

# Data Quality/Data Intregrity Report understanding


# box plot

boxplot(mtcars$mpg)
boxplot(mtcars$disp)
# what is IQR
# How to read box plot


boxplot(mtcars$mpg~mtcars$cyl)

data("mtcars")





















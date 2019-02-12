# data(package = .packages(all.available = TRUE))
# data mining
# machine learning- feedback loop

# Supervised algorithm
# Unsupervised algorithm

# Segmentation
# K Means clustering - diagram, betweenss, withinss & distance formula
# Examples of clustering- telecom & banking

# classfication & regression

# import the data sets
whole <- read.csv("Wholesale customers data.csv")
str(whole)
summary(whole)


apply(whole,2, function(x) sum(is.na(x)))



# dropping columns which are not important

whole$Channel <- NULL
whole$Region <- NULL


# standardization of variables
# concept of scaling and standard normal distribution


whole_scale <- as.data.frame(scale(whole))

# checking of standardization
(12669-mean(whole$Fresh))/sd(whole$Fresh)
# (x-mu)/sigma
# mu - mean()\
# sigma - standard deviation


set.seed(123)
sample(1:100,40)



set.seed(1001)
clusterdata <- kmeans(whole_scale,8)
clusterdata

clusterdata$withinss
clusterdata$betweenss



whole_final <- cbind(whole,cluster=clusterdata$cluster)

# profiling of cluster

mean(whole$Fresh)
tapply(whole_final$Fresh, whole_final$cluster, mean)

mean(whole$Grocery)
tapply(whole_final$Grocery, whole_final$cluster, mean)

mean(whole$Milk)
tapply(whole_final$Milk, whole_final$cluster, mean)

mydata <- whole_scale
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",ylab="Within groups sum of squares")


# install.packages("NbClust")
# library(NbClust)
# res<-NbClust(whole_scale, diss=NULL, distance = "euclidean", min.nc=2, max.nc=8,
#              method = "kmeans", index = "hubert")
# 
# res$All.index
# res$Best.nc
# res$Best.partition


# Market basket analysis
install.packages("arules")
# install.packages("arulesViz")
library("arules")
library(datasets)
# library(arulesViz)

data("Groceries")
class(Groceries)
inspect(Groceries)
summary(Groceries)


# data("AdultUCI")
# Adult = as(AdultUCI, "transactions")
# 
# 
# my_data = paste("1,2","1","2,3", sep="\n")
# write(my_data, file = "my_basket")
# trans = read.transactions("my_basket", format = "basket", sep=",")
# inspect(trans)



filter_Gro <- Groceries[size(Groceries)>=3]
summary(filter_Gro)


itemFrequencyPlot(Groceries,topN=20,type="absolute")

# Rules creation

rules <- apriori(Groceries,parameter = list(supp=0.001,conf=.8))
inspect(rules)
summary(rules)
inspect(rules[1:25])
# plot(rules)


rules_sort <- sort(rules, by="confidence", decreasing = TRUE)
inspect(rules_sort[1:10])

rules_sort <- sort(rules, by="lift", decreasing = TRUE)
inspect(rules_sort[1:10])



rules <- apriori(Groceries,parameter = list(supp=0.01,conf=0.8))
inspect(rules)
inspect(rules[1:25])

# limit size
rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.8,maxlen=3))
inspect(rules)
inspect(rules[1:25])


rules_min <- apriori(Groceries,parameter = list(supp=0.001,conf=0.8,minlen=5))
inspect(rules_min)
inspect(rules_min[1:25])


# targeting
rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.8,minlen=4),
                 appearance = list(default="lhs",rhs="whole milk"),
                 control=list(verbose=TRUE)
                 )
inspect(rules[1:25])

rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.8),
                 appearance = list(default="lhs",rhs="other vegetables"),
                 control=list(verbose=FALSE)
)
inspect(rules[1:25])

# where milk is not working
rules_1 <- sort(rules, by="confidence", decreasing = FALSE)
inspect(rules_1[1:25])

# Opposite view
rules_2 <- apriori(Groceries,parameter = list(supp=0.001,conf=0.15),
                 appearance = list(default="rhs",lhs="whole milk"),
                 control=list(verbose=FALSE)
)
inspect(rules_2)
inspect(rules_2[1:5])
# again with minlen
rules_2 <- apriori(Groceries,parameter = list(supp=0.001,conf=0.15,minlen=2),
                   appearance = list(default="rhs",lhs="whole milk"),
                   control=list(verbose=FALSE)
)
inspect(rules_2[1:5])


ISLR TREVOR HASTIE
GUJRATI 



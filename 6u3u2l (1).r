
# understanding of mean, median and mode

# understanding of coorelation
cor(mtcars$mpg,mtcars$disp)
cor(mtcars$mpg,mtcars$cyl)

cor_matrix <- as.data.frame(cor(mtcars))
# install.packages("corrgram")
# library('corrgram')


# explain the signifance of corelation


# What is histogram
# Why is histogram important
hist(data1$Age)
hist(mtcars$mpg)
hist(mtcars$mpg,labels = TRUE)
hist(mtcars$mpg,breaks = 10, labels = TRUE)
# check for breaks parameter

hist(rnorm(10000))

boxplot(mtcars$mpg~mtcars$cyl,main="MPG VS CYL")
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="CYL",ylab="MPG")
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="CYL",ylab="MPG",col='red')
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",
        xlab="CYL",ylab="MPG",
        col=c('red','yellow','azure4'))

# list of colors
colors()

table(mtcars$cyl)

# boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="MPG",ylab="CYL",
#         col=colors[1:length(unique(mtcars$cyl))])

# change background color

par(bg="white")
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="MPG",ylab="CYL",
        col=c('red','yellow','green'))


# save plot to disk
jpeg(file="boxplot.jpeg")
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="MPG",ylab="CYL",
        col=c('red','yellow','blue'))
dev.off()


png(file=paste0("boxplot",Sys.Date(),".png"))
boxplot(mtcars$mpg~mtcars$cyl,main="BOXPLOT",xlab="MPG",ylab="CYL",
        col=c('red','yellow','blue'))
dev.off()

# bivariate analysis
plot(mtcars$mpg,mtcars$disp)
plot(mtcars$mpg,mtcars$cyl)
plot(mtcars$mpg)

install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(factor(cyl))) + geom_bar() 

# + scale_x_discrete(limits=c(8,6,4))
ggplot(mtcars, aes(factor(cyl))) + geom_bar(width = .3)

ggplot(mtcars, aes(factor(cyl))) + geom_bar(width = .6) + coord_flip()

ggplot(mtcars, aes(factor(cyl))) + geom_bar(width = .6,fill='white',color='blue')

# Elegant Graphics for Data Analysis:HADLEY WICKHAM

qplot(factor(cyl), data=mtcars, geom="bar")

qplot(factor(cyl), data=mtcars, geom="bar",fill=factor(cyl))

ggplot(mpg, aes(displ, hwy)) + geom_point()

# ---------------------

ggplot(mtcars, aes(x=mpg, y=disp)) + geom_line() + geom_point()


plot(mtcars$mpg)
plot(mtcars$mpg,mtcars$disp)


plot(mtcars$mpg,type='l')
plot(mtcars$mpg,type='h')
plot(mtcars$mpg,type='o')


par(mfrow=c(2,2))
plot(mtcars$mpg,type='l')
plot(mtcars$mpg,type='h')
plot(mtcars$mpg,type='o')

par(mfrow=c(1,1))
plot(mtcars$mpg,type='l')




plot(mtcars$mpg,pch=1)
plot(mtcars$mpg,pch=3)
plot(mtcars$mpg,pch=3,col='red')
plot(mtcars$mpg,pch=c(as.factor(mtcars$cyl)),col=c(as.factor(mtcars$cyl)))





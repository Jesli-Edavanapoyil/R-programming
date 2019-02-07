rm(list = ls())
#---------------------------------------------------------------
#List - Vector where heterogenous data types can be present
#--------------------------------------------------------------

lst <- list(0.5, 0.841, 0.977) #Create list
class(lst)

lst2 = list(11,"Ram", TRUE, c(1,2,3)) #List can have multiple data types

#Another way of creating list
lst3 <- list()
lst3[[1]] <- 11
lst3[[2]] <- "Ram"
lst3[[3]] <- TRUE
lst3[[4]] <- c(1,2,3)
lst3[[5]] <- lst2
# lst3[[4]][2] <- c(4,5)

#List slicing
n=c(2,3,5)
s=c("aa","bb","cc","dd","ee")
b=c(TRUE,FALSE,TRUE,FALSE,FALSE)
x=list(n,s,b,3)
print(x)

x[2] #Returns first element
x[[2]] #What's difference between two?

x[c(2,4)] #Return mulitple elements

#modify the list 
x[[2]][1]="ta"
print(x)

#Name list elements
lst4 = list(Num=11,Chr="Ram",Bol=TRUE,Vec=c(1,2,3))

#Return value of elements by name
lst4[["Num"]]
lst4$Chr
lst4[c('Num','Vec')]


#---------------------------------------------------------
#FACTORS - It is categorical variable with mulitple levels
#---------------------------------------------------------

f2 <- c("low", "middle", "low", "low", "low", "low", "middle", "low",
        "middle", "middle", "middle", "middle", "middle", "high", "high",
        "low", "middle", "middle", "low", "high")

is.numeric(f2)
is.character(f2)
is.factor(f2)

f3 = factor(f2, levels = c("low","middle","high")) #to create factor variable 
# can create extra factor as well
f3 = factor(f2, levels = c("low","middle","high","low+middle")) #to create factor variable 

is.factor(f3)
as.integer(f3)
print(f3) #By default number of unique values will be levels
levels(f3) #To get levels of the factors

# default behavior
f4 = factor(f2)

#Ordered factor
f2_order = factor(f2,levels = c("low","middle","high") , order = TRUE) #Level values can be changed using labels 
print(f2_order)




#---------------------------------------------------
#Data import/export
#---------------------------------------------------
getwd()
setwd("F:\\Edureka\\DataSets")

data1 = read.csv("titanic.csv")
str(data1) #Summary of variables
head(data1) #Top rows

data2 = read.csv("Titanic.csv",stringsAsFactors = FALSE)

data2 = read.csv("titanic.csv",header = F)
str(data2)

data3 = read.csv("titanic.csv",header = T, sep = ",") #By default seperator of read.csv is comma
data4 = read.table("titanic.csv", sep = ",") #If you are reading csv by read.table then sep needs to be specified

data1 = read.csv("titanic.csv")
data1 = read.csv("titanic.csv",stringsAsFactors = FALSE)

data1 = read.csv("titanic.csv",colClasses=c("Name"="character"))

# colClasses=c("variableName"="character")

attach(data1)
attach(data2)
mean(Age)
mean(Age,na.rm = T)

detach(data1)
mean(data1$Age)
mean(data1$Age,na.rm = T)

write.csv(data1,"ttt.csv",row.names = F)

write.csv(data1,"ttt.csv",row.names = F)



# Explanation of datefunction
as.Date()
dates <- c("02/27/17", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
as.Date(dates, "%m/%d/%y")


x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
as.Date(x, "%d%b%Y")

#lubridate
library(lubridate)

# dataframe to matrix and vice versa
class(data1)
x <- as.matrix(data1)
y <- as.data.frame(x)


# > read.csv
# function (file, header = TRUE, sep = ",", quote = "\"", dec = ".", 
#           fill = TRUE, comment.char = "", ...) 
#   read.table(file = file, header = header, sep = sep, quote = quote, 
#              dec = dec, fill = fill, comment.char = comment.char, ...)
# <bytecode: 0x5e3fa88>
#   <environment: namespace:utils>
#   > read.csv2
# function (file, header = TRUE, sep = ";", quote = "\"", dec = ",", 
#           fill = TRUE, comment.char = "", ...) 
#   read.table(file = file, header = header, sep = sep, quote = quote, 
#              dec = dec, fill = fill, comment.char = comment.char, ...)

# two classes under numeric are double and intergar...r does it internall
# dataframe[,]

# subsetting data frames

drow <- data1[1:100,]

drow <- data1[1:100]
drow <- data1[1:10]

dcol <- data1[,c(3,4,5,6)]
dcol <- data1[3:6]
dcol <- data1[,c("Ticket","Survived")]
dexclude <- data1[,c(-3,-5)]

col_to_use <- c("Survived",
               "PclassTobe",
               "Sex",
               "SibSp"
               ,"Ticket")

dcol <- data1[col_to_use]



data1 <- data1[,c(-3,-5)]
# drop variable
data1$PassengerId <- NULL

drow <- data1[-c(1:100),]


# select observations
survive <- data1[data1$Survived==1,]
survive <- data1[data1$Survived==1 & data1$Sex=="male" ,  ]
survive <- data1[data1$Survived==1 & data1$Age < 40,]
# & data1$Age >40
# inclusive of NA

# another way of selecting observations
survive1 <- subset(data1,(Survived==1 & Sex=="male"))
survive1 <- subset(data1,(Survived==1 & Sex=="male" & Age < 40))
survive1 <- subset(data1,!(Survived==1 & Sex=="male" & Age > 40))
survive1 <- subset(data1,!(Survived==1 & Sex=="male" & Age >40),select = c(Survived,Sex,Age))



# cbind rbind
c1 <- data1[c(4,5,6)]
cbind1 <- cbind(data1,c1)

r1 <- data1[1:100,]
rbind <- rbind(data1,r1)


n=c(2,3,5,TRUE)
Cabin=c("aa","bb","cc","DD")
s=c("aa","bb","cc","DD")
b=c(TRUE,FALSE,TRUE,FALSE)
df=data.frame(n,Cabin,s,b)

rbind1 <- rbind(data1,df)



install.packages("gtools")
library(gtools)
bind <- smartbind(data1,df)


# new column in data frame
data1$annaul_fare <- data1$Fare * 12 


# data()
# data(package = .packages(all.available = TRUE))


# subsitution
x <- c("saurabh goel","saurabh verma","saurabh sharma")
sub("saurabh","gaurav",x)


y <- c("goel saurabh goel","saurabh saurabh","saurabh sharma")
sub("saurabh","gaurav",y)


y <- c("saurabh goel","saurabh saurabh","saurabh sharma")
gsub("saurabh","gaurav",y)


data1$Name1 <- gsub(","  ," X " ,data1$Name)

substr(x,1,3)
substr(x,1,3) <- "ABC"

data1$sub <- substr(data1$Name,1,10)
data1$sub1 <- substring(data1$Name,1,10)


# x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
# substr(x, 2, 5)
# substring(x, 2, 4:6)



data2 = read.csv("titanic.csv")
data2$str <- strsplit(data2$Name," ") 

data2 = read.csv("titanic.csv",stringsAsFactors = FALSE)

# other way around it
data2$Name <- as.character(data2$Name)
data2$str <- strsplit(data2$Name," ")

data1$Name1 <- strsplit(as.character(data1$Name)," ")


# data1$Name <- as.character(data1$Name)
data1$upper <- toupper(data1$Name)
data1$lower <- tolower(data1$Name)



# grep function
names(data1)
grep("Id",names(data1))
grep("Id",data1$Name)
grep("ID",names(data1))
grep("ID",names(data1),ignore.case = TRUE)

names(data1)[grep("ed",names(data1),ignore.case = TRUE)]




# grepl explanation
grepl("ED",names(data1),ignore.case = TRUE)
names(data1)[grepl("id",names(data1),ignore.case = TRUE)]

grep("and",data1$Name)


# sorting in data frames
VADeaths
mean(VADeaths[ ,2])
mean(VADeaths$RuralFemale)
mtcars
str(mtcars)
lapply(mtcars)







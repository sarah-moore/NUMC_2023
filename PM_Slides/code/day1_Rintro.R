# Create an object ----
x <- 4
y = 4


# Perform arithmetic with that object ---

x+5
x*5
x/5
x^5 

# Nest the object within functions ----
log(x)
log(4)
log(x, base=4)
factorial(x)
sqrt(x)

# Logical Operators and Comparisons ----

10^10 == 100^5
10^10 != 100^5 
(10^10 == 100^5) & (10^10 != 100^5)
(10^10 == 100^5) | (10^10 != 100^5)
150 < 157
150 <= 157
150 >= 157

# Creating More Complex Data Structures ---
#Create a vector of the five recent U.S. presidential election years 
year<-c(2000, 2004, 2008, 2012, 2016)
class(year) # what type of object is year 
length(year) # what is the length of the object 

# access a help file 
?Logic

2000 %in% year # is a value in the vector 

# assign names to elements of the vector 
names(year)<-c("Y1", "Y2", "Y3", "Y4", "Y5")
year

# index certain elements of the vector
year[3]
year["Y3"]

#Add another data point to the vector and name it. 
year[6]<-c(2020)
names(year)<-c("Y1", "Y2", "Y3", "Y4", "Y5","Y6")
year

# Adding to the Data Structure ---- 

# Create a variable of the corresponding 5 most recent presidents, less Biden. 
presidents<-c("Bush", "Bush", "Obama", "Obama", "Trump", NA)
is.na(presidents) # Logically indicates NA values
which(is.na(presidents)) # which position is the NA 
sum(is.na(presidents)) # sum of NA values in the vector 

# Now bind the two columns that you have so far. 
election <- cbind(year, presidents) # what is the warning message? 
election <- data.frame(election)

# Create another variable with the popular vote winners. 
popularVote <- c("Gore", "Bush", "Obama", "Obama", "Clinton", NA)
election <- cbind(election, popularVote)

is.data.frame(election) # returns a logical statement about whether or not election is a dataframe 
View(election)

# Indicate  whether the president won the pop. vote. with ifelse 
election$win <- NA
election$win <- ifelse(election$presidents == as.character(election$popularVote), 1, 0) # 1 if won popular vote, 0 otherwise

# Impose labels on the variable.
election$win <- factor(election$win, labels = c("Did not win popular vote", "Did win popular vote"))

levels(election$win)

# Indexing ----

#Index order goes [row,ccol]

# Find the winner of the popular vote in the first year of the dataframe. 
election[1,3]

# What does the entire column of popular vote winners look like. 
election[,3]

# What does the fourth entry of the dataframe look like. 
election[4,]

# Adding a Row ----

#Information for the final row of the dataset 
Y6 <- list(2020, "Biden", "Biden", 1) 
election[6,] <- rbind(Y6) # what's the warning here? 

levels(election$win)
election$win[election$year == 2020] <- "Did win popular vote"
class(election$win)

# External Data ----

# let's use some special packages to import data 

#install.packages("tidyverse")
#install.packages("haven")

library(tidyverse)
library(haven)

# read in the data 
alone <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-24/survivalists.csv')

# data available from tidy tuesday post 1/24/2023: https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-01-24/readme.md

# what does our data look like? 
View(alone)
dim(alone)
names(alone) 

# summarize the data 
summary(alone)
# summarize one variable at a time. 
summary(alone$age)

# Check for NAs in entire dataset  
sum(is.na(alone))
which(is.na(alone$age)) # or find which observations are NA in specific vars 

# Make a cool function to determine the percentage of missing values for a given variable  
perMiss <- function(x){
  (sum(is.na(x))/length(x))*100
  }
# apply() this function across all columns in dataset. 
missingAlone <- apply(alone, 2, perMiss) 
?apply # find out why we need the "2" argument 

sort(missingAlone, decreasing = T) # which variables have the most missingness? 

# let's check out summary statistics on specific variables 
mean(alone$medically_evacuated, na.rm = T) # why the na.rm argument ? 
mean(alone$days_lasted, na.rm=T)
sd(alone$days_lasted, na.rm=T)
hist(alone$days_lasted)

# look at where Alone survivalists are coming from 
table(alone$state)
prop.table(table(alone$result))



# saving files 
getwd()
write_csv(alone, file="PM_Slides/data/alone.csv")

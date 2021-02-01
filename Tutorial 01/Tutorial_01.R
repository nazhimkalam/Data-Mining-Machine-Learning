# EXERCISE (Objects and Arithmetic)
# Q1

# we have 2 vectors over here
x<-c(4, 2, 6)
y<-c(1, 0, -1)

# returns the length of the vector
length(x)

# returns the total addition result of the vector
sum(x)

# returns the total square addition result of the vector
sum(x^2)

# adds both vectors into one
x+y

x*y
x-2
x^2


# Q2

# creates a vector from numbers 7:11
7:11

# creates a vector from 2 to 9
seq(2, 9)

# creates a vector from 4 to 10 with an incrementation of 2
seq(4, 10, by=2)

# creates a vector from value 3 to 30 split equally by 10
seq(3, 30, length=10)

# creates a vector from 6to -2 with an decementation of 2
seq(6, -4, by=-2)

# Q3

# creating a vector of repeating 2, 4 times
rep(2, 4)

# creating a vector of repeating 1, 2, 4 times
rep(c(1, 2), 4)

# creating a vector of repeating 1, 4 times and then 2, 4 times
rep(
  c(1,2),
  c(4,4)
)

# creating a vector of repeating the vector of 1 2 3 4, 4 times
rep(1:4, 4)


rep(1:4,rep(3,4))

# Q4

rep(6, 6)

rep(c(5, 8), 4)

rep(c(5, 8), c(4, 4))


# EXERCISE (Summaries and Sub scripting)

x<-c(7.5, 8.2, 3.1, 5.6, 8.2, 9.3, 6.5, 7.0, 9.3, 1.2, 14.5, 6.2)

# lets get the mean value from the vector x
mean(x)

# variance of the vector x
var(x)

# Getting the summary data of the vector x
summary(x)

# accessing the first and the second element from the vector
x[1:2]

# this means give me the values at position 2,4 and 9 from the vector x
x[c(2, 4, 9)]

# this means that give me all other values which are not in the position 2, 4 and 9
x[-c(2, 4, 9)]

# Q1
x<- c(5,9,2,3,4,6,7,0,8,12,2,9)

x[2]
x[2:4]
x[c(2,3,6)]
x[c(1:5, 10:12)]
x[-(10:12)]

#Q2

y<-c(33, 44, 29, 16, 25, 45, 33, 19, 54, 22, 21, 49, 11, 24, 56)

shop1 <- y[c(1, 4, 7, 10, 13)]
shop2 <- y[c(2, 5, 8, 11, 14)]
shop3 <- y[c(3, 6, 9, 12, 15)]

summary(shop1)
summary(shop2)
summary(shop3)


# Matrices

# One way of creating matrices is by creating columns and then binding them
x <- c(5,7,9)
y <- c(6,3,4)

x
y

z <- cbind(x, y)
View(z)
dim(z)

# u can also use the rbind to bind rows
z1 <- rbind(z,z)
View(z1)

# Creating matrices using the matrix keyword 
z <- matrix(c(5, 7, 9, 6, 3, 4), nrow = 3) # matrix is filled up column-wise.
View(z)

z <- matrix(c(5, 7, 9, 6, 3, 4), nrow = 3, byrow = TRUE) # matrix is filled up row-wise.
View(z)

# Exercise under matrix
x <- matrix(c(3, 2, -1, 1), nrow = 2, ncol = 2, byrow = TRUE)
y <- matrix(c(1, 4, 0, 0, 1, -1), nrow = 2, ncol = 3, byrow = TRUE)

View(x)
View(y)

2*x
x*x     # normal multiplication
x%*%x   # matrix multiplication
x%*%y
t(y)
x
solve(x) # we can use this solve(x) like this to calculate the inverse of a matrix

x[1,]
x[2,]
x[,2]
y[1,2]
y[,2:3]

# Attaching to objects
data() # this will list the datasets which are provided by R

data("trees") # we can call an datasets like this

trees[1:5,]
View(trees[1:5,])

attach(trees) # we do this because then we are able to access the column names more in a clean way

mean(Height) # if we didnt use attach we have to get the mean like this mean(trees[,2])
mean(Volume)
mean(Girth)

# exercise
data("quakes")
summary(quakes$depth)
summary(quakes$mag)

data("mtcars")
help(mtcars)
mean(mtcars$wt)
mean(mtcars$mpg)


# Apply Function
# Returns a vector or array or list of values obtained by applying a function 
# to margins of an array or matrix.
# 1 <-- represents all rows
# 2 <-- represents all the columns

apply(trees, 2, mean) # returns the mean of all the columns in the dataset trees
apply(quakes, 2, mean)
apply(mtcars, 2, mean)

y <- matrix(c(1, 4, 1, 0, 2, -1), nrow = 2, ncol = 3, byrow = TRUE )
View(y)

apply(y[,2:3], 1, mean)





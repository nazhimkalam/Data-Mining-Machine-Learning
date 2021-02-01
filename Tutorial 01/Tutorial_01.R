# EXERCISE
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
















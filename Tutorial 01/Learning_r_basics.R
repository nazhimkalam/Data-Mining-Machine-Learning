# -----------------------------------BASICS-----------------------------------
# Print Hello World.
print("Hello World")

# Add two numbers.
print(23.9 + 11.6)

myString <- "Hello, World!"
print(myString)

v <- TRUE
print(class(v)) # logical

v <- 23.5
print(class(v)) # numeric

v <- 2L        # we use L for the integer data type
print(class(v))

v <- "TRUE"    # character
print(class(v))

v <- charToRaw("Hello")  # raw ("Hello" is stored as 48 65 6c 6c 6f)
print(class(v))

# -----------------------------------DATA TYPES--------------------------------
# DATA TYPES WE GONNA COVER IS
#   - VECTORS
#   - LISTS
#   - MATRICES
#   - ARRAYS
#   - FACTORS
#   - DATA FRAMES


# VECTORS
# - When you want to create vector with more than one element, you should use 
#   c() function which means to combine the elements into a vector.

# Create a vector.
apple <- c('red','green',"yellow")
print(apple)

# Get the class of the vector.
print(class(apple))

# ----------------------------------------------------------------------------

# LISTS
# - A list is an R-object which can contain many different types of elements
#   inside it like vectors, functions and even another list inside it.

# Create a list.
list1 <- list( c(2,5,3), 21.3, sin)

# Print the list.
print( list1 )

# ----------------------------------------------------------------------------

# Matrices
# - A matrix is a two-dimensional rectangular data set. It can be created using
#   a vector input to the matrix function.

# Create a matrix.
M = matrix( c('a','a','b','c','b','a'), nrow=2,ncol=3,byrow = TRUE)
print(M)

# ----------------------------------------------------------------------------

# In the below example we create an array with two elements which are 3x3 
# matrices each.
# Create an array.
a <- array( c('green','yellow'), dim = c(3,4,2) )
print(a)
View(a)

# ----------------------------------------------------------------------------

# Factors are the r-objects which are created using a vector. 
# It stores the vector along with the distinct values of the elements in the 
# vector as labels.

# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)  # returns the levels
print(nlevels(factor_apple))  # returns the number of levels

# ----------------------------------------------------------------------------

# Dataframe
# Unlike a matrix in data frame each column can contain different modes of data. 
# The first column can be numeric while the second column can be character and 
# third column can be logical. It is a list of vectors of equal length.

# Create the data frame.
BMI <- data.frame(
  gender = c("Male", "Male","Female"),
  height = c(152, 171.5, 165),
  weight = c(81,93, 78),
  Age =c(42,38,26)
)

print(BMI)

# ----------------------------- R - Variables ---------------------------------

# A valid variable name consists of "letters", "numbers" and the "dot" or "underline
# characters." The variable name starts with a 'letter' or the 'dot' 'not' followed by
# a 'number.'

# Assignment using equal operator.
var.1 = c(0,1,2,3)

# Assignment using leftward operator.
var.2 <- c("learn","R")

# Assignment using rightward operator.
c(TRUE,1) -> var.3

print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")

# -------------------------- DATA TYPE OF A VARIABLE --------------------------

# In R, a variable itself is not declared of any data type, rather it gets the
# data type of the R -object assigned to it. So R is called a dynamically typed
# language, which means that we can change a variable's data type of the same 
# variable again and again when using it in a program.

var_x <- "Hello"
cat("The class of var_x is ",class(var_x),"\n")


var_x <- 34.5
cat(" Now the class of var_x is ",class(var_x),"\n")


var_x <- 27L
print(var_x)
cat(" Next the class of var_x becomes ",class(var_x),"\n")

# ------------------------------ FINDING VARIABLES --------------------------

# To know all the variables currently available in the workspace we use the 
# ls() function

print(ls())

# ------------------------------ DELETING VARIABLES --------------------------

# Variables can be deleted by using the rm() function. Below we delete the 
# variable var.3. On printing the value of the variable error is thrown.

rm(var_x)


# ------------------------------ R - OPERATORS --------------------------

# An operator is a symbol that tells the compiler to perform specific 
# mathematical or logical manipulations

# TYPES OF OPERATORS
# We have the following types of operators in R programming

#   - Arithmetic Operators. 
#   - Relational Operators. 
#   - Logical Operators. 
#   - Assignment Operators. 
#   - Miscellaneous Operators. 


# ----------------------------- ARITHMETIC OPERATORS -------------------------

# Adds two vectors
v <- c( 2, 5.5, 6)
t <- c(8, 3, 4)
print(v + t)

# Subtracts second vector from the first
v <- c( 2, 5.5, 6)
t <- c(8, 3, 4)
print(v - t)

# Multiplies both vectors
v <- c( 2, 5.5, 6)
t <- c(8, 3, 4)
print(v * t)

# Divide the first vector with the second
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v / t)

# Give the remainder of the first vector with the second
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v %% t)

# The first vector raised to the exponent of second vector
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v^t)


# ----------------------------- RELATIONAL OPERATORS -------------------------

# Checks if each element of the first vector is greater than the corresponding 
# element of the second vector.
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v>t)

# Checks if each element of the first vector is less than the corresponding 
# element of the second vector
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v < t)

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v==t)

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v<=t)

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v>=t)

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v!=t)

# ----------------------------- LOGICAL OPERATORS ----------------------------
# It is called Element-wise Logical AND operator. It combines each element of the 
# first vector with the corresponding element of the second vector and gives a 
# output TRUE if both the elements are TRUE.
v <- c(3,0,TRUE,2+3i)
t <- c(4,1,FALSE,2+3i)
print(v&t)

v <- c(3,0,TRUE,2+2i)
t <- c(4,0,FALSE,2+3i)
print(v|t)

v <- c(3,0,TRUE,2+2i)
print(!v)


# Called Logical AND operator. Takes first element of both the vectors 
# and gives the TRUE only if both are TRUE.
v <- c(3,0,TRUE,2+2i)
t <- c(1,3,TRUE,2+3i)
print(v&&t)

v <- c(0,0,TRUE,2+2i)
t <- c(0,3,TRUE,2+3i)
print(v||t)

# ----------------------------- ASSIGNMENT OPERATORS -------------------------

# =, <-, <<-
v1 <- c(3,1,TRUE,2+3i)
v2 <<- c(3,1,TRUE,2+3i)
v3 = c(3,1,TRUE,2+3i)

print(v1)
print(v2)
print(v3)


c(3,1,TRUE,2+3i) -> v1
c(3,1,TRUE,2+3i) ->> v2

print(v1)
print(v2)

# ----------------------------- MISCELLANEOUS OPERATORS ----------------------

# These operators are used to for specific purpose and not general mathematical 
# or logical computation.

# Colon operator. It creates the series of numbers in sequence for a vector.
v <- 2:8
print(v)

# This operator is used to identify if an element belongs to a vector.

v1 <- 8
v2 <- 12
t <- 1:10

print(v1 %in% t)
print(v2 %in% t)

# This operator is used to multiply a matrix with its transpose.
M = matrix( c(2,6,5,1,10,4), nrow=2,ncol=3,byrow = TRUE)
t = M %*% t(M)
print(t)


# ----------------------------- R - DECISION MAKING ---------------------------
x = 20

if(is.numeric(x)){
  print("x is a numeric")
}


x <- c("what","is","truth")

if("Truth" %in% x){
  print("Truth is found")
  
} else {
  print("Truth is not found")
  
}

x <- switch(
  4,
  "first",
  "second",
  "third",
  "fourth"
)
print(x)

# ------------------------------ R-Loops ------------------------------------

v <- c("Hello","loop")
count <- 2

# REPEAT LOOP
repeat{
  print(v)
  count <- count + 1
  if(count > 5){
    break
  }
}

# WHILE LOOP
v <- c("Hello","while loop")
count <- 2
while (count < 7){
  print(v)
  count = count + 1
}

# FOR LOOP
v <- LETTERS[1:4]
for ( index in v) {
  print(index)
}

# Break Statements
v <- c("Hello","loop")
cnt <- 2
repeat{
  print(v)
  cnt <- cnt+1
  if(cnt > 5){
    break
  }
}

# next is like continue in python
v <- LETTERS[1:6]
for ( i in v){
  if (i == "D"){
    next
  }
  print(i)
}

# -------------------------------------- FUNCTIONS ------------------------------

# R has a number of in built functions which can be used in our program as well
# as R allows us to define our own functions as well where we can use them with
# in our program.

# BUILT IN FUNCTIONS 

# Create a sequence of numbers from 32 to 44.
print(seq(32,44))

# Find mean of numbers from 25 to 82.
print(mean(25:82))

# Find sum of numbers from 41 to 68.
print(sum(41:68))


# USER DEFINED FUNCTIONS

# Create a function to print squares of numbers in sequence.
# (WITH ARGUEMENT)
myFunction <- function(number){
  for (i in 1:number) {
    print(i^2)
  }
}

myFunction(10) # <---- call the function

# (WITHOUT ARGUEMENT)
myFunction <- function() {
  for(i in 1:5) {
    print(i^2)
  }
}

myFunction() # <---- call the function

# Calling a Function with Argument Values (by position and by name)

# Create a function with arguments.
myFunction <- function(a, b, c) {
  result <- a * b + c
  print(result)
}

# Call the function by position of arguments.
myFunction(5, 3, 11)

# Call the function by names of the arguments.
myFunction(a=11, b=5, c=3)

# ------------------------------------- R STRINGS -----------------------------

# Strings in General
a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)

# Concatenating Strings - paste() function
a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

# collapse is used to eliminate the space in between two strings. 
# But not the space within two words of one string.
print(paste(a,b,c, sep = "", collapse = ""))

# Formatting number & Strings - format() function
# Numbers and strings can be formatted to a specific style using format()function.

# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 7)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 7)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Counting number of characters in a string - nchar() function --------
result <- nchar("Count the number of characters")
print(result)

# Changing the case - toupper() & tolower() functions
x <- c('one', 'nazhim')
toupper(x)
tolower(x)

# Changing to Upper case.
result <- toupper("Changing To Upper")
print(result)

# Changing to lower case.
result <- tolower("Changing To Lower")
print(result)

# Extracting parts of a string - substring() function
# Extract characters from 5th to 7th position.
result <- substring("Extract", 5, 7)
print(result)



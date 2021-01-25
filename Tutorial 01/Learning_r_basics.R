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

# ----------------------------------------------------------------------------

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












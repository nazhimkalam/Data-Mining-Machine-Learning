# Age Vector
age <- c(25, 35, 50)

# Salary Vector
salary <- c(200000, 1200000, 2000000)

# Data frame created using age and salary
df <- data.frame( "Age" = age, "Salary" = salary, stringsAsFactors = FALSE)

#Display df
# Pay attention on how values for age and salary vary in different ranges
print(df)
View(df)


# THIS WAS THE TUTORIAL FOR NORMALIZATION ---------------

# We have to normalize the data

# 1.)
# Using the Min-Max Normalization 
# Data frame could be normalized using Min-Max normalization technique which is 
# specified by the following formula to be applied on each value of features to be normalized

# This is the equation for Min Max Normalization
# (X - min(X))/(max(X) - min(X))  
# This is equivalent to the following R function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# This is how we apply the normalize function (This takes in the dataframe and the normalize function
# and apply the normalization for all the values of the dataframe th)
dfNorm <- as.data.frame(lapply(df, normalize))
View(dfNorm)

# 2.)
# Z-Score Standardization
# The drawback of Min Max Scalar is that it will also include outliers in a way that it will affect
# the normalization
# z-score standardization technique suits better
# n order to achieve z-score standardization, one could use R's built-in scale() function.

# dfNormZ <- as.data.frame( scale(df[1:2] ))
dfNormZ <- as.data.frame(scale(df))
View(dfNormZ)


# THIS SECTION OF THE TUTORIAL IS FOR THE PCA ANALYSIS PART

# This first exercise primarily leverages the USArrests data set that is built into R.
# This is a set that contains four variables that represent the number of arrests per 100,000 residents for Assault,
# Murder, and Rape in each of the fifty US states in 1973.
# The data set also contains the percentage of the population living in urban areas, UrbanPop.

library(tidyverse) # data manipulation and visualization (first load tidyverse and then rlang!)
library(gridExtra) # plot arrangement
library(ggplot2)   # for ggplot and qplot
library(rlang)     # is needed in tidyverse package

data("USArrests")
head(USArrests, 10)
view(head(USArrests, 10))

# Preparing the Data ------
# compute variance of each variable (getting the current variation)
# The second input here denotes whether we wish to compute the mean of the rows,
# 1, or the columns, 2. Here we are interested for the columns (attributes)
apply(USArrests, 2, var)

# Standardizing each variable will fix this issue

# create new data frame with centered variables
scaled_df <- apply(USArrests, 2, scale)
head(scaled_df)

# IMPORTANT ------

# In order to calculate principal components, we start by using the cov() 
# function to calculate the covariance matrix.

# Followed by the eigen command to calculate the eigenvalues of the matrix.

# Eigen produces an object that contains both the ordered eigenvalues ($values) 
# and the corresponding eigenvector matrix ($vectors).


# Calculate eigenvalues & eigenvectors
arrests.cov <- cov(scaled_df) # we calculate the covariance matrix.
arrests.eigen <- eigen(arrests.cov) 

print(arrests.eigen)
print(str(arrests.eigen))

## List of 2
## $ values : num [1:4] 2.48 0.99 0.357 0.173
## $ vectors: num [1:4, 1:4] -0.536 -0.583 -0.278 -0.543 0.418 ...

# For our example, we'll take the first two sets of loadings and store them in the matrix phi
# Extract the loadings
phi <- arrests.eigen$vectors[,1:2]
print(phi)

phi <- (-phi)
row.names(phi) <- c("Murder", "Assault", "UrbanPop", "Rape")
colnames(phi) <- c("PC1", "PC2")
view(phi)

# Calculate Principal Components scores
PC1 <- as.matrix(scaled_df) %*% phi[,1] # %*% in R does matrix multiplication
PC2 <- as.matrix(scaled_df) %*% phi[,2]

# Create data frame with Principal Components scores
PC <- data.frame(State = row.names(USArrests), PC1, PC2)
head(PC)
view(head(PC))


# Plot Principal Components for each State
ggplot(PC, aes(PC1, PC2)) +
  modelr::geom_ref_line(h = 0) +
  modelr::geom_ref_line(v = 0) +
  geom_text(aes(label = State), size = 3) +
  xlab("First Principal Component") +
  ylab("Second Principal Component") +
  ggtitle("First Two Principal Components of USArrests Data")
Because


PVE <- arrests.eigen$values / sum(arrests.eigen$values)
round(PVE, 2)


# PVE (aka scree) plot
PVEplot <- qplot(c(1:4), PVE) +
  geom_line() +
  xlab("Principal Component") +
  ylab("PVE") +
  ggtitle("Scree Plot") +
  ylim(0, 1)


# Cumulative PVE plot
cumPVE <- qplot(c(1:4), cumsum(PVE)) +
  geom_line() +
  xlab("Principal Component") +
  ylab(NULL) +
  ggtitle("Cumulative Scree Plot") +
  ylim(0,1)

grid.arrange(PVEplot, cumPVE, ncol = 2)


# -----------------------------------------------------------------------------
# Built in PCA Functions


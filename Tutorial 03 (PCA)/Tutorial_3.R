# TUTORIAL 03: Data Pre Processing (Normalization and PCA)

# Why should we normalize the data or scale them?
# - Features with larger scale will completely dominate the other, so there wont be any proper
#   correlation between the data hence we need to normalize the data points properly.

# - The goal of normalization is to make every data point have the same scale so each feature
#   is equally important

# There are multiple way normalization can be done for the data points as follows:
# 1. Min Max Normalization
# 2. Standard Scalar Normalization


# What is PCA (Principle Component Analysis)?
# - PCA is an unsupervised statistical technique used for dimensionality reduction.
# - Using PCA we can convert a data set with large number of feature into smaller number
# - We do this because to reduce the accuracy loss when training the model and also not loose any data

# Exercise 01 - Normalization
age = c(25, 35, 50)                         # age vector
salary = c(200000, 1200000, 2000000)        # salary vector
df = data.frame("Age" = age, "Salary" = salary, stringsAsFactors = FALSE)  # data frame
print(df)

  # Creating the Min-Max Normalization function (but note that its better to use standard scalar)
normalize = function(x){
  return((x - min(x))/(max(x) - min(x)))
}

  # Applying the normalization function on the dataset we just created on
normalized_df = as.data.frame(lapply(df, normalize)) 
print(normalized_df)

  # Using Z-Score Standardization or Standard Scalar to normalize the data values (Best Approach)
standarded_normalized_df = as.data.frame(scale(df))
print(standarded_normalized_df)

# Exercise 02 - PCA (Principal Component Analysis) (Using the Build in PCA Function)

library(tidyverse) # data manipulation and visualization (first load tidyverse and then rlang!)
library(gridExtra) # plot arrangement
library(ggplot2)   # for ggplot and qplot
library(rlang)     # is needed in tidyverse package

library(datasets)
data("USArrests")
df = USArrests

summary(df)

  # Performing PCA
df_pca = prcomp(df, scale = TRUE) # (here we are saying the perform scaling and PCA in a single line)
summary(df_pca)
print(df_pca$rotation)

df_covariance <- cov(USArrests)
print(df_covariance)

df_ev <- eigen(df_covariance)
print(df_ev)
df_ev$values

# The eigenvectors and eigenvalues of a covariance (or correlation) 
# matrix represent the "core" of a PCA: The eigenvectors (principal components) 
# determine the directions of the new feature space, and the eigenvalues determine
# their magnitude.














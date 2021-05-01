# Loading the package 
library(ggvis)
library(class)
library(gmodels)

# Reading the data-set "vehicles.xlsx"
wine = read.csv("D:/IIT/2nd Year/Data Mining & Machine Leanring/Tutorials/Tutorial 06/winedata.csv")
View(wine)

# create a vector
v <- 1:178  # as we have 178 samples
# Randomize the order of the vector
v <- sample(v)
# Randomize the order of the data frame
wine_random <- wine[sample(1:nrow(wine)), ]  # why we need to randomize the dataset? Think about

head(wine_random)

#Let's see the structure of wine data set
str(wine_random)
#detailed view of the data set
summary(wine_random)

#plot the species
wine_random %>% ggvis(~Alcohol, ~Malic, fill = ~factor(Type)) %>%
  layer_points()

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
norm_wine <- as.data.frame(lapply(wine_random[2:14], normalize))  # start from 2, as column one is associated to class (i.e. desired output).

# The following code shows a summary of the normalized data frame:
  
summary(norm_wine)
summary(norm_wine$Alcohol)

#Training and Test Data
trainset <- norm_wine[1:100, ]
testset <- norm_wine[101:178, ]

#Labels
trainset_labels <- wine_random[1:100, 1]
testset_labels <- wine_random[101:178, 1]

knn_prediction <- knn(train = trainset, test = testset,cl = trainset_labels, k=15)
CrossTable(x=testset_labels, y=knn_prediction,prop.chisq=FALSE)

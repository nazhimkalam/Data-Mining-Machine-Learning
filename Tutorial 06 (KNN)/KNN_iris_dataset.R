
# USING THE IRIS DATASET

# Importing Libraries
library(datasets)
library(ggplot2)
library(gridExtra)
library(class)
library(caret)

# Displaying the head data 
head(iris)
View(iris)
summary(iris)
print(unique(iris$Species))

# Creating plots

# Plotting Sepal length vs Sepal width
p1 <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species)) +
  geom_point(alpha=0.8)

# Plotting Petal length vs Sepal Petal
p2 <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width, col=Species)) +
  geom_point(alpha=0.8)

# Plotting the graphs
grid.arrange(p1, p2, ncol=2)

# Build a k-Nearest Neighbours Model
# We will now use the knn function from the class package to create a 
# k-Nearest Neighbours model for the iris dataset.

# getting random 70% of the data points 
ind <- sample(1:nrow(iris), nrow(iris)*0.7)   
View(data.frame(ind))

# setting the 70% of the data points for training
iris.train <- iris[ind, ]

# setting the remaining 30% of the data points for testing
iris.test <- iris[-ind, ]

# We will now use the knn function from the class package to 
# create a k-Nearest Neighbours model for the iris dataset with k=3

knn.fit <- knn(train = iris.train[,1:4], test = iris.test[,1:4],
               cl = iris.train$Species, k = 3)

error[i] = 1- mean(knn.fit == iris.test$Species)
accuracy <- mean(knn.fit == iris.test$Species)
cat("Training Accuracy: ", accuracy, sep='')

# Checking with predicted values and the actual testing values
table(iris.test$Species,knn.fit)

# Creating the confusion matrix
nb.test.acc1 <- confusionMatrix(iris.test$Species, knn.fit, mode="everything")
nb.test.acc1

# The selection of K=3 in the previous model was somewhat arbitrary. 
# In the figure below, we will plot the KNN model's training accuracy 
# for several values of K.

error <- c()
valid_acc <- c()

for (i in 1:19)
{
  knn.fit <- knn(train = iris.train[,1:4], test = iris.test[,1:4], cl = iris.train$Species, k = i)
  error[i] = 1- mean(knn.fit == iris.test$Species)
  valid_acc <- c(valid_acc, mean(knn.fit == iris.test$Species))
}
ggplot(data = data.frame(error), aes(x = 1:19, y = error)) +
  geom_line(color = "Blue")

# validation accuracy percentage
max(valid_acc) * 100

# best 4 value
which.max(valid_acc) 









# Loading the data set and reading the head of the dataset
df <- iris
head(iris)
View(head(df))

# Creating plots of the dataset with respect to the label col which is Species
plot(df[c("Petal.Length", "Petal.Width")], col=df$Species)

# Using a seed because the points taken for the cluster always changes when u run the code
# df[rows, cols]
set.seed(101)
resultCuster <- kmeans(df[,1:4], centers = 3, nstart=20)
resultCuster

# Comparing the predicted clusters with the original data
View(table(resultCuster$cluster, df$Species))

# plotting these clusters out
library(cluster)
clusplot(df, resultCuster$cluster, color=T, shade=T, labels=0, lines=0)

# Using the Elbow method to find the exact number of centroids/clusters
tot.withinss <- vector(mode="character", length=10)
for (i in 1:10){
  irisCluster <- kmeans(df[,1:4], center=i,nstart=20)
  tot.withinss[i] <- irisCluster$tot.withinss
}

plot(1:10, tot.withinss, type="b", pch=19)

# Now you can see that 3 is the optimal one

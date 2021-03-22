
library("factoextra")
library("NbClust")

# Dataset
df = iris
View(df) 

# Checking for null values present
is.null(df)

# Since K Means is an Unsupervised approach we need to remove the label col
df1 = within(df, rm("Species"))
View(df1)

fviz_nbclust(df1, kmeans, method = "wss") + 
  geom_vline(xintercept = 3
             , linetype = 2) + 
  labs(subtitle = "Elbow method")

fviz_nbclust(df1, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

set.seed(180)
fviz_nbclust(df1, kmeans, nstart = 50,  method = "gap_stat", nboot = 50)+
  labs(subtitle = "Gap statistic method")

# No much data pre processing needed because the dataset is clean already
# Using the K Means Algorithm
results = kmeans(df1, 3)

# comparing result with actual and predicted
table(df$Species, results$cluster)

# Size of the result
results$size

# CLusters of the results
results$cluster

# Plotting graph
plot( df1[ c("Petal.Length", "Petal.Width") ], col = results$cluster )

plot( df[ c("Petal.Length", "Petal.Width") ], col = df$Species )

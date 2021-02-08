
# Dataset
df = iris
View(df) 

# Checking for null values present
is.null(df)

# Since K Means is an Unsupervised approach we need to remove the label col
df1 = within(df, rm("Species"))
View(df1)

# No much data pre processing needed because the dataset is clean already
# Using the K Means Algorithm
results = kmeans(df1, 3)

# Size of the result
results$size

# CLusters of the results
results$cluster

# Plotting graph
plot( df1[ c("Petal.Length", "Petal.Width") ], col = results$cluster )

plot( df[ c("Petal.Length", "Petal.Width") ], col = df$Species )

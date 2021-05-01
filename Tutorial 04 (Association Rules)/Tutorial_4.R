# Tutorial 04 -  Association Rules

# Groceries Example

# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set
data(Groceries)

# To view the first five transactions
inspect(head(Groceries)) # see the head function!

str(Groceries)

Groceries@itemInfo$labels[1:20]

which(Groceries@itemInfo$labels == 'citrus fruit')

which(Groceries@itemInfo$labels == 'semi-finished bread')

transactions <- read.transactions(
  file="baskets",
  format = c("basket"),
  sep = ",",
  cols =NULL,
  rm.duplicates = 1,
  skip = 0
)

summary(Groceries)

itemLabels(Groceries)[1:10]

# Top 10 most frequent items, both by frequency and absolute counts, may be visualized as follows:
par(mfrow=c(1,2))

itemFrequencyPlot(Groceries, type="relative",
                  topN=10, # can be changed to the number of interest
                  horiz=TRUE,
                  col='steelblue3',
                  xlab='',
                  main='Item frequency, relative')

itemFrequencyPlot(Groceries, type="absolute",
                  topN=10,
                  horiz=TRUE,
                  col='steelblue3',
                  xlab='',
                  main='Item frequency, absolute')


# least frequently bought items
par(mar=c(2,10,2,2), mfrow=c(1,2))
barplot(sort(table(unlist(LIST(Groceries))))[1:10]/9835,
        horiz=TRUE,
        las=1,
        col='steelblue3',
        xlab='',
        main='Frequency, relative')

barplot(sort(table(unlist(LIST(Groceries))))[1:10],
        horiz=TRUE,
        las=1,
        col='steelblue3',
        xlab='',
        main='Frequency, absolute')
# which might tell us there are not many babies in the neighbourhood!










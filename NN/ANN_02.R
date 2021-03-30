# MLP NN (ANN)
# https://www.geeksforgeeks.org/multi-layered-neural-networks-in-r-programming/

# The first step is to pick the dataset
set.seed(500)
library(MASS)
library(neuralnet)
data <- Boston
View(data)

# check for missing values or data points
apply(data, 2, function(x) sum(is.na(x)))

# Split the data into two sets, Train set and Test set. 
index <- sample(1 : nrow(data),  
                round(0.75 * nrow(data))) 
train <- data[index, ] 
test <- data[-index, ] 

View(train)

# Now normalize the data set before training a Neural network.
# medv is the label to be predicted where as the rest are the features

maxs <- apply(data, 2, max) 
mins <- apply(data, 2, min)
scaled <- as.data.frame(scale(data, 
                              center = mins,
                              scale = maxs - mins))
train_ <- scaled[index, ]
test_ <- scaled[-index, ]

# Now fit the data into Neural network
nn <- neuralnet(medv ~., 
                data = train_, 
                hidden = c(4, 2), 
                linear.output = T)
plot(nn)

# Create the test dataset
Predict_ = compute(nn, test_)
View(Predict_$net.result)










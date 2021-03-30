# https://www.datacamp.com/community/tutorials/neural-network-models-r

# install package
install.packages("neuralnet")
library("neuralnet")

# creating training data set
TKS=c(20,10,30,20,80,30) # normal variables / features  
CSS=c(90,20,40,50,50,80) # normal variables / features
Placed=c(1,0,0,0,1,1)   # class variable / dependent variable

# Here, you will combine multiple columns or features into a single set of data
df=data.frame(TKS,CSS,Placed)
View(df)

# - Placed~TKS+CSS, Placed is predicting label and TKS and CSS are features.
# - df is dataframe,
# - hidden=3: represents single layer with 3 neurons respectively.
# - act.fct = "logistic" used for smoothing the result.
# - linear.ouput=FALSE: set FALSE for apply act.fct otherwise TRUE

# fit neural network
set.seed(100)
nn=neuralnet( Placed~., data=df, hidden=3, act.fct = "logistic", linear.output = FALSE)
plot(nn)

# Create the test dataset
TKS=c(30,40,85)
CSS=c(85,50,40)
test=data.frame(TKS,CSS)
View(test)

# Prediction using neural network
# (Predict the probability score for the test data using the compute function.)
Predict = compute(nn, test)
View(Predict$net.result)

# Converting probabilities into binary classes setting threshold level 0.5
# if its less than 0.5 then we around into 0 else 1
prob = Predict$net.result
pred = ifelse(prob > 0.5, 1, 0)
View(pred)

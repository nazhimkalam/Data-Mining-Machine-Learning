# Tutorial Naive Bayes
# Iris Dataset

library(e1071)
library(caret)
data(iris)

str(iris)
summary(iris)

classifier <- naiveBayes(iris[,1:4],iris[,5])
table(predict(classifier, iris[,-5]), iris[,5], dnn=list('predicted','actual'))

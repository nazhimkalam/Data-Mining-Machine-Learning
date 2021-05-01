library(e1071)
library(caret)
library(readxl)

students<-read_excel("D:/IIT/2nd Year/Data Mining & Machine Leanring/Tutorials/Tutorial 05 (NB)/hsbdemo.xlsx")
head(students)
View(head(students))

# detailed view of the data set
str(students)
students$prog <- as.factor(students$prog)
str(students)
summary(students)

# creation of Training and Testing Set
trainIndex <- createDataPartition(students$prog, p=0.7)$Resample1
train <- students[trainIndex, ]
test<- students[-trainIndex, ]

# Classifier
NBclassifier <- naiveBayes(prog~., data=train)
NBclassifier

NBclassifier$apriori

NBclassifier$tables$science

trainPred <- predict(NBclassifier, newdata = train, type = "class")
trainTable <- table(train$prog, trainPred)
trainTable

trainAcc <- sum(diag(trainTable))/sum(trainTable)*100
trainAcc

testPred <- predict(NBclassifier, newdata = test, type = "class")
testTable <- table(test$prog, testPred)
testTable

testAcc<- sum(diag(testTable))/sum(testTable)*100
testAcc
rm(list = ls())
data = read.csv("/Users/mohammad/Downloads/Uni/Term 8/Data Mining/Tree Decision/bank1.csv")

#Create training and test data
inputdata = data[1:27460, ] # training data
testdata = data[27461:41188, ] # test data

#Classification Tree
library(rpart)
formula = y ~ age + job + marital + education + default + housing + loan + contact + month 

dtree = rpart(formula, data = inputdata, method="class", control=rpart.control(minsplit=30,cp=0.001))

plot(dtree)
text(dtree)
printcp(dtree)
plotcp(dtree)


#Prune the Tree 
pdtree = prune(dtree, cp=dtree$cptable[which.min(dtree$cptable[,"xerror"]),"CP"])

#Model Testing
out = predict(pdtree)
table(out[1:13728],testdata$y)
y_predicted = colnames(out)[max.col(out, ties.method = c("first"))] # predicted
y_input = as.character (testdata$y) # actuals
mean (y_input != y_predicted) # misclassification %

library(caret)
y2 = as.factor(y_input)
y1 = as.factor(y_predicted)
confusion_mat = confusionMatrix(y1[1:13728], y2)

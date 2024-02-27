rm(list = ls())
data = read.csv("/Users/mohammad/Downloads/Uni/Term 8/Data Mining/Tree Decision/bank1.csv")
formula = y ~ age + job + marital + education + default + housing + loan + contact + month 

#Create training and test data
inputdata = data[1:27460, ] # training data
testdata = data[27461:41188, ] # test data

# Training model
logestic = glm(formula = formula, data = inputdata, family = "binomial")

# Predict test data based on model
predict_reg = predict(logestic, testdata, type = "response")

# Changing probabilities
predict_reg = ifelse(predict_reg > 0.5, 1, 0)

library(caret)
y2 = as.factor(logestic$y)
y1 = as.factor(predict_reg)
confusion_mat = confusionMatrix(y1, y2[1:13728])



rm(list = ls())
data = read.csv("/Users/mohammad/Downloads/Uni/Term 8/Data Mining/Tree Decision/bank1.csv")
formula = y ~ age + job + marital + education + default + housing + loan + contact + month 

#Create training and test data
inputdata = data[1:27460, ] # training data
testdata = data[27461:41188, ] # test data

fit.knn = train(y ~ ., data = inputdata, method="knn")
knn.k1 = fit.knn$bestTune # keep this Initial k for testing with knn() function in next section
print(fit.knn)

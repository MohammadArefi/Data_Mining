rm(list = ls())
library(factoextra)
library(cluster)

data = read.csv("C:/Users/user/Desktop/Me/Uni/Term 8/data mining/Supervised Learning/Tree Decision/bank1.csv")
kmeans (data$age, centers = 4, 10)

citibike.May20.50K <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/citibike.May20.50K.csv")
citybike.test10000B <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/citybike.test10000B.csv")
citybike.test10000A <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/citybike.test10000A.csv")
citybike.test10000Awithduration <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/citybike.test10000Awithduration.csv")
tripduration.lm <- lm(tripduration~usertype+gender, data = citibike.May20.50K)
summary(tripduration.lm)
tripdurationB.lm.predictions <- predict(tripduration.lm, citybike.test10000B)
tripdurationA.lm.predictions <- predict(tripduration.lm, citybike.test10000A)
source('C:/Users/slee2/OneDrive/Data_101/R_Code/Errors.R')
regr.error(tripdurationA.lm.predictions,citybike.test10000Awithduration$tripduration)
#mae          mse         rmse         mape 
#1.169248e+03 1.762016e+08 1.327409e+04 2.039945e+00
write.csv(tripdurationB.lm.predictions,file="sl1768-section4-1000Bpredictions.csv")
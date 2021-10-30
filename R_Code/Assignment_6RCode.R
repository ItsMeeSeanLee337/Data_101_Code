historic_temp <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/historic_temp.csv")

#Hypothesis 1 Testing with cherry picking
data2003 <- subset(historic_temp, historic_temp$Year =="2003", na.rm = TRUE)
data1950 <- subset(historic_temp, historic_temp$Year =="1950", na.rm = TRUE)
meanACT2003 <- mean(data2003$AverageCelsiusTemperature, na.rm=TRUE)
meanACT1950 <- mean(data1950$AverageCelsiusTemperature, na.rm=TRUE)
standardDeviationOfACT <- sd(historic_temp$AverageCelsiusTemperature > -76, na.rm = TRUE)
zScoreOfACT = (meanACT2003 - meanACT1950)/standardDeviationOfACT
pOfACT <- 1- pnorm(zScoreOfACT)

#Hypothesis 2 Testing with p-hacking(very small sample size for 1868)
data1902 <- subset(historic_temp, historic_temp$Year == "1868", na.rm=TRUE)
data2004 <- subset(historic_temp, historic_temp$Year == "2004", na.rm=TRUE)
meanMCT2004 <- mean(data2004$MinCelsiusTemp, na.rm=TRUE)
meanMCT1902 <- mean(data1902$MinCelsiusTemp, na.rm=TRUE)
standardDeviationOfMCT <- sd(historic_temp$MinCelsiusTemp > -70 & historic_temp$MinCelsiusTemp < 40, na.rm = TRUE)
zScoreOfMCT = (meanMCT2004 - meanMCT1902)/standardDeviationOfMCT
pOfMCT <- 1- pnorm(zScoreOfMCT)
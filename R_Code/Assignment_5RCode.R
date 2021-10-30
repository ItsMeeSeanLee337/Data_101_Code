citibike.May20.50K <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/citibike.May20.50K.csv")

#Hypothesis 1 testing
meanOfTripDuration <- mean(citibike.May20.50K$tripduration)
standardDeviationOfTripDuration <- sd(citibike.May20.50K$tripduration)
zScoreOfTripDuration <- (meanOfTripDuration-1200)/standardDeviationOfTripDuration
pOfTripDuration <- 1-pnorm(zScoreOfTripDuration)
pOfTripDuration

#Hypothesis 2 testing
meanOfAge <- mean(citibike.May20.50K$birth.year)
standardDeviationOfAge <- sd(citibike.May20.50K$birth.year)
zScoreOfAge <- (meanOfAge-1980)/standardDeviationOfAge
pOfAge <- 1-pnorm(zScoreOfAge)
pOfAge
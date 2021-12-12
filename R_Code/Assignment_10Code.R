install.packages('rpart')
install.packages('rpart.plot')
library(rpart)
library(rpart.plot)
ExpandedF21DataSurveyWithSectionsAnonymized <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/ExpandedF21DataSurveyWithSectionsAnonymized.csv")
# Initializing All Variables
ChocolateOrVanilla <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$ChocolateOrVanilla)
RightLeftHanded <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$RightLeftHanded)
OddEven <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$OddEvenSection)
ThermostatTemperature <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$ThermostatTemperature)
CanRollTongue <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$CanRollTongue)
CellPhone <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$CellPhoneType)
Floaters <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$Floaters)
RotaryPhone <- as.factor(ExpandedF21DataSurveyWithSectionsAnonymized$RotaryPhone)
# Tree 1
decisiontreeChocolateOrVanilla <- rpart(ChocolateOrVanilla ~ DressColor + CanRollTongue + ThermostatTemperature + RightLeftHanded, data = ExpandedF21DataSurveyWithSectionsAnonymized, method = "class")
rpart.plot(decisiontreeChocolateOrVanilla)
printcp(decisiontreeChocolateOrVanilla)

# Tree 2
decisiontreeThermostatTemperature <- rpart(ThermostatTemperature ~ OddEven + CellPhone + RotaryPhone + DressColor, data = ExpandedF21DataSurveyWithSectionsAnonymized, method = "class")
rpart.plot(decisiontreeThermostatTemperature)
printcp(decisiontreeThermostatTemperature)


# Tree 3
decisiontreeDressColor <- rpart(DressColor ~ RotaryPhone + OddEven + CellPhone + Floaters, data = ExpandedF21DataSurveyWithSectionsAnonymized, method = "class", cp = 0.001)
rpart.plot(decisiontreeDressColor)
printcp(decisiontreeDressColor)

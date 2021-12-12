ExpandedF21DataSurveyWithSectionsAnonymized <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/ExpandedF21DataSurveyWithSectionsAnonymized.csv")
View(ExpandedF21DataSurveyWithSectionsAnonymized)
# Position 1:
table(ExpandedF21DataSurveyWithSectionsAnonymized$Floaters, ExpandedF21DataSurveyWithSectionsAnonymized$ThermostatTemperature)
# Find the probability that a student will set the thermostat to cool and they see floaters: (99/165) = 0.6
table(ExpandedF21DataSurveyWithSectionsAnonymized$Floaters)
# Find the probability that a student will see floaters: (166/247) = 0.672
table(ExpandedF21DataSurveyWithSectionsAnonymized$ThermostatTemperature)
# Find the probability that a student will set the thermostat to cool: (144/247) = 0.583

# Position 2:
table(ExpandedF21DataSurveyWithSectionsAnonymized$OddEvenSection, ExpandedF21DataSurveyWithSectionsAnonymized$CellPhoneType)
# Find the probability that a student will use an iPhone and choose odd: (92/118) = 0.78
table(ExpandedF21DataSurveyWithSectionsAnonymized$OddEvenSection)
# Find the probability that a student will choose odd: (118/241) = 0.49
table(ExpandedF21DataSurveyWithSectionsAnonymized$CellPhoneType)
# Find the probability that a student will use an iPhone: (190/247) = 0.769

# Position 3:
table(ExpandedF21DataSurveyWithSectionsAnonymized$RightLeftHanded, ExpandedF21DataSurveyWithSectionsAnonymized$Follow_Football, ExpandedF21DataSurveyWithSectionsAnonymized$GrossedOutByFoodAnswer)
# Find the probability that a student will be grossed out by the foot question and right handed and watch american football: (44/54) = 0.815
table(ExpandedF21DataSurveyWithSectionsAnonymized$GrossedOutByFoodAnswer)
# Find the probability that a student will be grossed out by the food question: (158/247) = 0.64
table(ExpandedF21DataSurveyWithSectionsAnonymized$RightLeftHanded, ExpandedF21DataSurveyWithSectionsAnonymized$Follow_Football)
# Find the probability that a student will be right handed and watch american football: (65/79) = 0.823
citibike.May20.50K <- read.csv("C:/Users/slee2/Downloads/citibike.May20.50K.csv")
#Plot that compares the number of male riders to female riders
barplot(table(citibike.May20.50K$gender), main="Male vs. Female Users", xlab="Number of Riders", ylab="Gender", names.arg = c("Unknown", "Male", "Female"), horiz=TRUE, col=c("Gray", "Blue", "Red"))

#Plot that shows the density of riders by Age Group
plot(citibike.May20.50K$birth.year, main = "Density of Rider Age", xlab="", ylab="Year of Birth", pch=18, col="Dark Green", xaxt="n")

#Plot that compares number of customers to subscribers
pie(table(citibike.May20.50K$usertype), main="Pie Chart of Userbase")
salaries.by.college.type <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/Final/salaries-by-college-type.csv")
salaries.by.region <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/Final/salaries-by-region.csv")
degrees.that.pay.back <- read.csv("C:/Users/slee2/OneDrive/Data_101/Datasets/Final/degrees-that-pay-back.csv")
# Multiple Box plots per college type
engineer <- subset(salaries.by.college.type, School.Type == "Engineering")
engineer$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", engineer$Starting.Median.Salary))
engineer$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", engineer$Mid.Career.Median.Salary))

party <- subset(salaries.by.college.type, School.Type == "Party")
party$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", party$Starting.Median.Salary))
party$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", party$Mid.Career.Median.Salary))


liberal.arts <- subset(salaries.by.college.type, School.Type == "Liberal Arts")
liberal.arts$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", liberal.arts$Starting.Median.Salary))
liberal.arts$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", liberal.arts$Mid.Career.Median.Salary))


state <- subset(salaries.by.college.type, School.Type == "State")
state$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", state$Starting.Median.Salary))
state$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", state$Mid.Career.Median.Salary))

# Starting Median Salary
boxplot(engineer$Starting.Median.Salary, 
        party$Starting.Median.Salary, 
        liberal.arts$Starting.Median.Salary, 
        state$Starting.Median.Salary, 
        main = "Boxplots for Starting Median Salary per School Type", 
        xlab = "School Type", 
        ylab = "Median Starting Salary in $", 
        names = c("Engineering", "Party", "Liberal Arts", "State"), 
        col = c("Green", "Red", "Blue", "Yellow"))

# Mid Career Median Salary
boxplot(engineer$Mid.Career.Median.Salary, 
        party$Mid.Career.Median.Salary, 
        liberal.arts$Mid.Career.Median.Salary, 
        state$Mid.Career.Median.Salary, 
        main = "Boxplots for Mid-Career Median Salary per School Type", 
        xlab = "School Type", 
        ylab = "Median Mid-Career Salary in $", 
        names = c("Engineering", "Party", "Liberal Arts", "State"), 
        col = c("Green", "Red", "Blue", "Yellow"))

# Stacked Bar Plots per Region
California <- subset(salaries.by.region, Region == "California")
California$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", California$Starting.Median.Salary))
California$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", California$Mid.Career.Median.Salary))

Western <- subset(salaries.by.region, Region == "Western")
Western$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", Western$Starting.Median.Salary))
Western$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", Western$Mid.Career.Median.Salary))

Midwestern <- subset(salaries.by.region, Region == "Midwestern")
Midwestern$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", Midwestern$Starting.Median.Salary))
Midwestern$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", Midwestern$Mid.Career.Median.Salary))

Southern <- subset(salaries.by.region, Region == "Southern")
Southern$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", Southern$Starting.Median.Salary))
Southern$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", Southern$Mid.Career.Median.Salary))

Northeastern <- subset(salaries.by.region, Region == "Northeastern")
Northeastern$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", Northeastern$Starting.Median.Salary))
Northeastern$Mid.Career.Median.Salary = as.numeric(gsub("[\\$,]", "", Northeastern$Mid.Career.Median.Salary))

vectorinput <- c(mean(California$Starting.Median.Salary), 
                 mean(Western$Starting.Median.Salary), 
                 mean(Midwestern$Starting.Median.Salary),
                 mean(Southern$Starting.Median.Salary),
                 mean(Northeastern$Starting.Median.Salary),
                 mean(California$Mid.Career.Median.Salary), 
                 mean(Western$Mid.Career.Median.Salary), 
                 mean(Midwestern$Mid.Career.Median.Salary),
                 mean(Southern$Mid.Career.Median.Salary),
                 mean(Northeastern$Mid.Career.Median.Salary))

regions <- matrix(vectorinput, nrow = , ncol = 5)
colnames(regions) <- c("California", "Western", "Midwestern", "Southern", "Northeastern")
rownames(regions) <- c("Starting Median Salary Average", "Mid-Career Median Salary Average")

barplot(regions, 
        col = c("light blue", "blue"), 
        main = "Starting vs Mid Career Average per Region", 
        xlab = "Region", 
        ylab = "Salary in $")

# Histogram for salary for degrees
degrees.that.pay.back$Starting.Median.Salary = as.numeric(gsub("[\\$,]", "", degrees.that.pay.back$Starting.Median.Salary))
barplot(degrees.that.pay.back$Starting.Median.Salary, 
        names.arg=c(degrees.that.pay.back$Undergraduate.Major[1:50]), 
        las=2, col="#69b3a2", 
        cex.names = 0.75, 
        main = "Degrees and Corresponding Median Starting Salary")
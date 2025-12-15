# Create vectors (FIX: age had only 14 values, added NA)
empid  <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
age    <- c(30,37,45,32,50,60,35,32,34,32,30,43,50,60, NA)
gender <- c(0,1,0,1,1,1,0,0,1,0,0,1,1,0,0)
status <- c(1,1,2,2,1,1,1,2,2,1,2,1,2,1,2)

# Create data frame
empinfo <- data.frame(empid, age, gender, status)
print(empinfo)

# Convert to factors
empinfo$gender <- factor(empinfo$gender,
                         levels = c(0,1),
                         labels = c("female","male"))

empinfo$status <- factor(empinfo$status,
                         levels = c(1,2),
                         labels = c("staff","faculty"))

print(empinfo)

# Subset data
male   <- subset(empinfo, gender == "male")
female <- subset(empinfo, gender == "female")

print(male)
print(female)

# Summary statistics
summary(empinfo)
summary(male)
summary(female)
summary(empinfo$age)

# Frequency tables
table1 <- table(empinfo$gender)
print(table1)

table2 <- table(empinfo$status)
print(table2)

table3 <- table(empinfo$gender, empinfo$status)
print(table3)

# Plots
plot(empinfo$age, type="l",
     main="Age of Employees",
     xlab="Employee ID",
     ylab="Age in years",
     col="blue")

pie(table1, main="Gender Distribution")

barplot(table3,
        beside = TRUE,
        xlim = c(0,5),
        ylim = c(0,6),
        col = c("blue","red"),
        main = "Gender vs Status")

legend("topright",
       legend = rownames(table3),
       fill = c("blue","red"),
       bty = "n")

boxplot(age ~ status,
        data = empinfo,
        col = c("red","blue"),
        main = "Average Age by Status",
        ylab = "Age")

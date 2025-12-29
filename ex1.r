# Create vectors (FIXED: removed NA, 15 values)
empid  <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
age    <- c(30,37,45,32,50,60,35,32,34,43,32,30,43,50,60)
gender <- c(0,1,0,1,1,1,0,0,1,0,0,1,1,0,0)
status <- c(1,1,2,2,1,1,1,2,2,1,2,1,2,1,2)

# Create data frame
empinfo <- data.frame(empid, age, gender, status)

# Convert numeric codes to factors (EXACT mapping)
empinfo$gender <- factor(empinfo$gender,
                         levels = c(0,1),
                         labels = c("male","female"))

empinfo$status <- factor(empinfo$status,
                         levels = c(1,2),
                         labels = c("staff","faculty"))

# Subset data
male   <- subset(empinfo, gender == "male")
female <- subset(empinfo, gender == "female")

# Summary statistics
summary(empinfo)
summary(male)
summary(female)
summary(empinfo$age)

# Frequency tables
table1 <- table(empinfo$gender)
table2 <- table(empinfo$status)
table3 <- table(empinfo$gender, empinfo$status)

# Plots
plot(empinfo$age,
     type = "l",
     main = "Age of Employees",
     xlab = "empid",
     ylab = "age in years",
     col = "blue")

pie(table1, main = "Gender Distribution")

barplot(table3,
        beside = TRUE,
        col = c("blue","red"),
        ylim = c(0,5),
        main = "Gender vs Status")

legend("topright",
       legend = rownames(table3),
       fill = c("blue","red"),
       bty = "n")

boxplot(empinfo$age ~ empinfo$status,
        col = c("red","blue"),
        main = "Age by Status",
        ylab = "Age")

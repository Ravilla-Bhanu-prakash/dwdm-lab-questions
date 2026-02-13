# CSA16 DATA WAREHOUSE AND DATA MINING - LAB SOLUTIONS
# Part 1: Statistics and Visualization (Exercises 2, 4-8, 10-11, 14, 16-21, 25, 31, 33-34)

# ============================================================================
# EXERCISE 2: Mean, Median, Mode, Midrange, and Quartiles
# ============================================================================
data2 <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

# (a) Mean and Median
mean_val <- mean(data2)
median_val <- median(data2)
cat("Mean:", mean_val, "\n")
cat("Median:", median_val, "\n")

# (b) Mode
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
mode_val <- get_mode(data2)
cat("Mode:", mode_val, "\n")
cat("Modality: The data is multimodal (25 appears 4 times)\n")

# (c) Midrange
midrange <- (min(data2) + max(data2)) / 2
cat("Midrange:", midrange, "\n")

# (d) First and Third Quartiles
q1 <- quantile(data2, 0.25)
q3 <- quantile(data2, 0.75)
cat("Q1 (First Quartile):", q1, "\n")
cat("Q3 (Third Quartile):", q3, "\n")

# ============================================================================
# EXERCISE 4: Data Smoothing (Bin Mean, Bin Median, Bin Boundaries)
# ============================================================================
data4 <- c(11, 13, 13, 15, 15, 16, 19, 20, 20, 20, 21, 21, 22, 23, 24, 30, 40, 45, 45, 45, 71, 72, 73, 75)

# Divide into 3 equal-frequency bins
bin_size <- length(data4) / 3
bin1 <- data4[1:floor(bin_size)]
bin2 <- data4[(floor(bin_size)+1):(2*floor(bin_size))]
bin3 <- data4[(2*floor(bin_size)+1):length(data4)]

# a) Smoothing by bin mean
bin1_mean <- mean(bin1)
bin2_mean <- mean(bin2)
bin3_mean <- mean(bin3)

data4_bin_mean <- c(rep(bin1_mean, length(bin1)), 
                    rep(bin2_mean, length(bin2)), 
                    rep(bin3_mean, length(bin3)))
cat("Exercise 4a - Smoothing by Bin Mean:\n")
cat("Bin 1:", bin1, " -> Mean:", bin1_mean, "\n")
cat("Bin 2:", bin2, " -> Mean:", bin2_mean, "\n")
cat("Bin 3:", bin3, " -> Mean:", bin3_mean, "\n")
cat("Smoothed data:", data4_bin_mean, "\n\n")

# b) Smoothing by bin median
bin1_median <- median(bin1)
bin2_median <- median(bin2)
bin3_median <- median(bin3)

data4_bin_median <- c(rep(bin1_median, length(bin1)), 
                      rep(bin2_median, length(bin2)), 
                      rep(bin3_median, length(bin3)))
cat("Exercise 4b - Smoothing by Bin Median:\n")
cat("Bin 1 Median:", bin1_median, "\n")
cat("Bin 2 Median:", bin2_median, "\n")
cat("Bin 3 Median:", bin3_median, "\n")
cat("Smoothed data:", data4_bin_median, "\n\n")

# c) Smoothing by bin boundaries
bin1_boundary <- c(rep(min(bin1), length(bin1)/2), rep(max(bin1), ceiling(length(bin1)/2)))
bin2_boundary <- c(rep(min(bin2), length(bin2)/2), rep(max(bin2), ceiling(length(bin2)/2)))
bin3_boundary <- c(rep(min(bin3), length(bin3)/2), rep(max(bin3), ceiling(length(bin3)/2)))

data4_bin_boundary <- c(bin1_boundary[1:length(bin1)], 
                        bin2_boundary[1:length(bin2)], 
                        bin3_boundary[1:length(bin3)])
cat("Exercise 4c - Smoothing by Bin Boundaries:\n")
cat("Smoothed data:", data4_bin_boundary, "\n\n")

# ============================================================================
# EXERCISE 5: Hospital Age and Body Fat Data - Statistics and Plots
# ============================================================================
age5 <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
bodyfat5 <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7)

# (a) Mean, Median, Standard Deviation
cat("EXERCISE 5 - Hospital Data Analysis\n")
cat("Age - Mean:", mean(age5), ", Median:", median(age5), ", SD:", sd(age5), "\n")
cat("Body Fat - Mean:", mean(bodyfat5), ", Median:", median(bodyfat5), ", SD:", sd(bodyfat5), "\n\n")

# (b) Boxplots
par(mfrow=c(1,2))
boxplot(age5, main="Boxplot of Age", ylab="Age (years)")
boxplot(bodyfat5, main="Boxplot of Body Fat %", ylab="Body Fat %")
par(mfrow=c(1,1))

# (c) Scatter plot and Q-Q plot
par(mfrow=c(1,2))
plot(age5, bodyfat5, main="Scatter Plot: Age vs Body Fat", 
     xlab="Age (years)", ylab="Body Fat %", pch=19)
qqnorm(age5, main="Q-Q Plot of Age")
qqline(age5)
par(mfrow=c(1,1))

# ============================================================================
# EXERCISE 6: Normalization Methods for Age Data
# ============================================================================
age_value <- 35
age_mean <- mean(age5)
age_sd <- 12.94

cat("\nEXERCISE 6 - Normalization of Age = 35\n")

# (i) Min-Max Normalization
age_min <- min(age5)
age_max <- max(age5)
normalized_minmax <- (age_value - age_min) / (age_max - age_min)
cat("(i) Min-Max Normalization: ", normalized_minmax, "\n")

# (ii) Z-Score Normalization
normalized_zscore <- (age_value - age_mean) / age_sd
cat("(ii) Z-Score Normalization: ", normalized_zscore, "\n")

# (iii) Decimal Scaling Normalization
max_abs <- max(abs(age5))
j <- ceiling(log10(max_abs))
normalized_decimal <- age_value / (10^j)
cat("(iii) Decimal Scaling Normalization: ", normalized_decimal, "\n")

# ============================================================================
# EXERCISE 7: Vector Operations - Pencils in Boxes
# ============================================================================
cat("\nEXERCISE 7 - Pencils in Boxes\n")
boxes <- c(9, 25, 23, 12, 11, 6, 7, 8, 9, 10)
cat("Data:", boxes, "\n")
cat("Mean:", mean(boxes), "\n")
cat("Median:", median(boxes), "\n")
cat("Mode:", get_mode(boxes), "\n")

# ============================================================================
# EXERCISE 8: Scatter Plot - Mobile Phones Sales
# ============================================================================
cat("\nEXERCISE 8 - Mobile Phones Sales vs Money\n")
x8 <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)
y8 <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)
plot(x8, y8, main="Mobile Phones Sold vs Money", 
     xlab="Number of Mobile Phones Sold", ylab="Money", pch=19)

# ============================================================================
# EXERCISE 9: Equal-Frequency and Equal-Width Partitioning with Histogram
# ============================================================================
cat("\nEXERCISE 9 - Data Partitioning\n")
marks9 <- c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75)
marks9_sorted <- sort(marks9)

# (a) Equal-frequency (equi-depth) partitioning into 3 bins
n <- length(marks9_sorted)
bin_freq_size <- n / 3
eq_freq_bin1 <- marks9_sorted[1:floor(bin_freq_size)]
eq_freq_bin2 <- marks9_sorted[(floor(bin_freq_size)+1):(2*floor(bin_freq_size))]
eq_freq_bin3 <- marks9_sorted[(2*floor(bin_freq_size)+1):n]

# (b) Equal-width partitioning into 3 bins
bin_width <- (max(marks9_sorted) - min(marks9_sorted)) / 3
eq_width_bin1 <- marks9_sorted[marks9_sorted <= min(marks9_sorted) + bin_width]
eq_width_bin2 <- marks9_sorted[marks9_sorted > min(marks9_sorted) + bin_width & 
                                 marks9_sorted <= min(marks9_sorted) + 2*bin_width]
eq_width_bin3 <- marks9_sorted[marks9_sorted > min(marks9_sorted) + 2*bin_width]

cat("Equal-Frequency Bins:\n")
cat("Bin 1:", eq_freq_bin1, "\n")
cat("Bin 2:", eq_freq_bin2, "\n")
cat("Bin 3:", eq_freq_bin3, "\n\n")

cat("Equal-Width Bins:\n")
cat("Bin 1:", eq_width_bin1, "\n")
cat("Bin 2:", eq_width_bin2, "\n")
cat("Bin 3:", eq_width_bin3, "\n\n")

# Histogram
par(mfrow=c(1,2))
hist(marks9_sorted, main="Histogram - Student Marks", breaks=5, xlab="Marks", ylab="Frequency")
hist(marks9_sorted, main="Histogram - Equal Width Bins", 
     breaks=c(min(marks9_sorted), min(marks9_sorted)+bin_width, 
              min(marks9_sorted)+2*bin_width, max(marks9_sorted)), xlab="Marks", ylab="Frequency")
par(mfrow=c(1,1))

# ============================================================================
# EXERCISE 10: Inter-Quartile Range and Standard Deviation
# ============================================================================
cat("\nEXERCISE 10 - Car Speed Analysis\n")
speed10 <- c(78.3, 81.8, 82, 74.2, 83.4, 84.5, 82.9, 77.5, 80.9, 70.6)
q1_10 <- quantile(speed10, 0.25)
q3_10 <- quantile(speed10, 0.75)
iqr_10 <- q3_10 - q1_10
sd_10 <- sd(speed10)
cat("Q1:", q1_10, "\n")
cat("Q3:", q3_10, "\n")
cat("IQR:", iqr_10, "\n")
cat("Standard Deviation:", sd_10, "\n")

# ============================================================================
# EXERCISE 14: Class Performance Comparison with Boxplot
# ============================================================================
cat("\nEXERCISE 14 - Class Performance Comparison\n")
classA <- c(76, 35, 47, 64, 95, 66, 89, 36, 84)
classB <- c(51, 56, 84, 60, 59, 70, 63, 66, 50)

cat("Class A - Mean:", mean(classA), ", Median:", median(classA), 
    ", Range:", max(classA)-min(classA), "\n")
cat("Class B - Mean:", mean(classB), ", Median:", median(classB), 
    ", Range:", max(classB)-min(classB), "\n\n")

boxplot(classA, classB, names=c("Class A", "Class B"), 
        main="Class Performance Comparison", ylab="Marks")

# ============================================================================
# EXERCISE 16: Histogram for AirPassengers Dataset
# ============================================================================
cat("\nEXERCISE 16 - AirPassengers Histogram\n")
hist(AirPassengers, breaks=seq(100, 700, by=150), 
     main="AirPassengers Dataset", xlab="Number of Passengers", ylab="Frequency")

# ============================================================================
# EXERCISE 17: Multiple Lines in Line Chart (mtcars dataset)
# ============================================================================
cat("\nEXERCISE 17 - Multiple Lines Chart\n")
plot(mtcars$mpg, type="l", col="blue", main="MPG and QSEC from mtcars", 
     ylab="Value", xlab="Car Index", ylim=c(min(mtcars$qsec), max(mtcars$mpg)))
lines(mtcars$qsec, type="l", col="red")
legend("topleft", legend=c("MPG", "QSEC"), col=c("blue", "red"), lty=1)

# ============================================================================
# EXERCISE 18: Water Dataset - Linear Regression
# ============================================================================
cat("\nEXERCISE 18 - Water Dataset Linear Regression\n")
data(water)
plot(water$hardness, water$mortality, main="Mortality vs Hardness", 
     xlab="Hardness", ylab="Mortality")
model18 <- lm(mortality ~ hardness, data=water)
abline(model18, col="red")
summary(model18)

# Prediction for hardness = 88
pred_mortality <- predict(model18, newdata=data.frame(hardness=88))
cat("Predicted Mortality for Hardness=88:", pred_mortality, "\n")

# ============================================================================
# EXERCISE 19: Boxplot for mtcars - MPG vs Cylinders
# ============================================================================
cat("\nEXERCISE 19 - MPG vs Cylinders Boxplot\n")
boxplot(mpg ~ cyl, data=mtcars, main="MPG by Number of Cylinders", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

# ============================================================================
# EXERCISE 20: Outliers Detection Using Boxplot (Tennis Example)
# ============================================================================
cat("\nEXERCISE 20 - Outliers Detection\n")
# Example: Tennis player scores
points <- c(45, 42, 48, 50, 47, 49, 46, 48, 100, 51, 49, 50, 48, 47, 49)
boxplot(points, main="Tennis Player Points - Outlier Detection", ylab="Points Scored")
cat("Data:", points, "\n")
q1 <- quantile(points, 0.25)
q3 <- quantile(points, 0.75)
iqr <- q3 - q1
lower_bound <- q1 - 1.5*iqr
upper_bound <- q3 + 1.5*iqr
outliers <- points[points < lower_bound | points > upper_bound]
cat("Outliers (beyond 1.5*IQR):", outliers, "\n")

# ============================================================================
# EXERCISE 21: Blood Pressure vs Age Analysis (Diabetes Dataset)
# ============================================================================
cat("\nEXERCISE 21 - Blood Pressure vs Age\n")
# Creating sample diabetes data if not available
diabetes_data <- data.frame(
  Age = c(21, 25, 28, 35, 40, 45, 50, 55, 60, 65),
  BloodPressure = c(110, 115, 118, 120, 125, 130, 135, 140, 145, 150)
)

par(mfrow=c(1,2))
plot(diabetes_data$Age, diabetes_data$BloodPressure, main="Blood Pressure vs Age", 
     xlab="Age (years)", ylab="Blood Pressure")
barplot(diabetes_data$BloodPressure, names.arg=diabetes_data$Age, 
        main="Blood Pressure by Age Group", xlab="Age", ylab="Blood Pressure")
par(mfrow=c(1,1))

# ============================================================================
# EXERCISE 25: Diabetes Trend Analysis - Linear and Multiple Regression
# ============================================================================
cat("\nEXERCISE 25 - Diabetes Trend Analysis\n")
# Sample diabetes analysis
diabetes_trend <- data.frame(
  Age = c(25, 30, 35, 40, 45, 50, 55, 60),
  DiabetesLevel = c(85, 92, 100, 110, 125, 140, 155, 170),
  BMI = c(22, 24, 25, 27, 29, 31, 33, 35)
)

# Linear regression
model_linear <- lm(DiabetesLevel ~ Age, data=diabetes_trend)
summary(model_linear)

# Multiple regression
model_multiple <- lm(DiabetesLevel ~ Age + BMI, data=diabetes_trend)
summary(model_multiple)

plot(diabetes_trend$Age, diabetes_trend$DiabetesLevel, main="Diabetes Level by Age", 
     xlab="Age", ylab="Diabetes Level")
abline(model_linear, col="red")

# ============================================================================
# EXERCISE 31: K-Means Clustering (Manual example)
# ============================================================================
cat("\nEXERCISE 31 - K-Means Clustering\n")
employee_data <- data.frame(
  EmployeeID = c(111, 222, 333, 444, 555, 666),
  Age = c(28, 25, 26, 25, 30, 29),
  Salary = c(150000, 150000, 160000, 160000, 170000, 200000),
  CreditScore = c(39, 27, 42, 40, 64, 72)
)

kmeans_result <- kmeans(employee_data[, c("Age", "Salary", "CreditScore")], centers=3)
employee_data$Cluster <- kmeans_result$cluster
cat("K-Means Clustering Results:\n")
print(employee_data)

plot(employee_data$Age, employee_data$Salary, col=kmeans_result$cluster, 
     main="Employee Clustering (Age vs Salary)", pch=19)

# ============================================================================
# EXERCISE 33: Vegetarian Count Analysis
# ============================================================================
cat("\nEXERCISE 33 - Vegetarian Analysis\n")
persons <- c("Gopu", "Babu", "Baby", "Gopal", "Krishna", "Jai", "Dev", "Malini", "Hema", "Anu")
vegetarian <- c("yes", "yes", "yes", "no", "yes", "no", "no", "yes", "yes", "yes")

veg_count <- sum(vegetarian == "yes")
non_veg_count <- sum(vegetarian == "no")

cat("Total Vegetarians:", veg_count, "\n")
cat("Total Non-Vegetarians:", non_veg_count, "\n")
cat("Greater Count:", ifelse(veg_count > non_veg_count, "Vegetarians", "Non-Vegetarians"), "\n")

barplot(c(veg_count, non_veg_count), names.arg=c("Vegetarian", "Non-Vegetarian"), 
        main="Vegetarian vs Non-Vegetarian Count", ylab="Count")

# ============================================================================
# EXERCISE 34: Scatter Plot - Mobile Phones Sales (Duplicate)
# ============================================================================
cat("\nEXERCISE 34 - Mobile Phones Sales Scatter Plot\n")
x34 <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)
y34 <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)
plot(x34, y34, main="Mobile Phones Sold vs Revenue", 
     xlab="Number of Mobile Phones Sold", ylab="Revenue", pch=19, col="blue")

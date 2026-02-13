###############################################################################
# EXERCISE 21: BLOOD PRESSURE VS AGE ANALYSIS
# Diabetes Dataset
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 21 - BLOOD PRESSURE VS AGE ANALYSIS\n")
cat("="*80, "\n")

# Sample diabetes data
diabetes_data <- data.frame(
  Age = c(21, 25, 28, 35, 40, 45, 50, 55, 60, 65),
  BloodPressure = c(110, 115, 118, 120, 125, 130, 135, 140, 145, 150)
)

cat("\nDiabetes Dataset:\n")
print(diabetes_data)

# ============================================================================
# CORRELATION AND REGRESSION
# ============================================================================

correlation <- cor(diabetes_data$Age, diabetes_data$BloodPressure)
cat(sprintf("\n\nCorrelation between Age and Blood Pressure: %.4f\n", correlation))
cat("This indicates a STRONG POSITIVE relationship\n\n")

# ============================================================================
# VISUALIZATION
# ============================================================================

par(mfrow=c(1,2))

# Scatter plot
plot(diabetes_data$Age, diabetes_data$BloodPressure,
     main="Blood Pressure vs Age",
     xlab="Age (years)",
     ylab="Blood Pressure (mmHg)",
     pch=19,
     col="darkred",
     cex=1.5)

# Add regression line
model <- lm(BloodPressure ~ Age, data=diabetes_data)
abline(model, col="blue", lwd=2)

# Bar chart
barplot(diabetes_data$BloodPressure,
        names.arg=diabetes_data$Age,
        main="Blood Pressure by Age Group",
        xlab="Age",
        ylab="Blood Pressure (mmHg)",
        col="lightcoral",
        border="black")

par(mfrow=c(1,1))

###############################################################################
# END OF EXERCISE 21
###############################################################################

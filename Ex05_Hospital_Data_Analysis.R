###############################################################################
# EXERCISE 5: HOSPITAL DATA ANALYSIS
# Age and Body Fat Data for 18 Adults
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 5 - HOSPITAL DATA ANALYSIS\n")
cat("="*80, "\n")

# Given data: Age and Body Fat for 18 adults
age <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
bodyfat <- c(9.5, 26.5, 7.8, 17.8, 31.4, 25.9, 27.4, 27.2, 31.2, 34.6, 42.5, 28.8, 33.4, 30.2, 34.1, 32.9, 41.2, 35.7)

cat("\nData loaded: 18 observations\n")

# ============================================================================
# (a) CALCULATE MEAN, MEDIAN, AND STANDARD DEVIATION
# ============================================================================

cat("\n(a) STATISTICS FOR AGE AND BODY FAT\n")

age_mean <- mean(age)
age_median <- median(age)
age_sd <- sd(age)

bodyfat_mean <- mean(bodyfat)
bodyfat_median <- median(bodyfat)
bodyfat_sd <- sd(bodyfat)

cat(sprintf("\nAGE (years):\n"))
cat(sprintf("  Mean:   %.2f\n", age_mean))
cat(sprintf("  Median: %.2f\n", age_median))
cat(sprintf("  SD:     %.2f\n", age_sd))

cat(sprintf("\nBODY FAT (%):\n"))
cat(sprintf("  Mean:   %.2f\n", bodyfat_mean))
cat(sprintf("  Median: %.2f\n", bodyfat_median))
cat(sprintf("  SD:     %.2f\n", bodyfat_sd))

# ============================================================================
# (b) DRAW BOXPLOTS FOR AGE AND BODY FAT
# ============================================================================

cat("\n(b) CREATING BOXPLOTS...\n")

par(mfrow=c(1,2))
boxplot(age, main="Boxplot of Age", ylab="Age (years)", col="lightblue")
boxplot(bodyfat, main="Boxplot of Body Fat", ylab="Body Fat (%)", col="lightcoral")
par(mfrow=c(1,1))

cat("    Boxplots created (see graphics window)\n")

# ============================================================================
# (c) DRAW SCATTER PLOT AND Q-Q PLOT
# ============================================================================

cat("\n(c) CREATING SCATTER PLOT AND Q-Q PLOT...\n")

par(mfrow=c(1,2))

# Scatter plot
plot(age, bodyfat, 
     main="Scatter Plot: Age vs Body Fat",
     xlab="Age (years)",
     ylab="Body Fat (%)",
     pch=19,
     col="darkblue",
     cex=1.2)

# Add regression line
model <- lm(bodyfat ~ age)
abline(model, col="red", lwd=2)

# Q-Q plot for age
qqnorm(age, main="Q-Q Plot of Age", pch=19)
qqline(age, col="red", lwd=2)

par(mfrow=c(1,1))

cat("    Scatter plot and Q-Q plot created (see graphics window)\n")

# ============================================================================
# ADDITIONAL ANALYSIS
# ============================================================================

# Correlation between Age and Body Fat
correlation <- cor(age, bodyfat)
cat(sprintf("\nCorrelation between Age and Body Fat: %.4f\n", correlation))

# Linear regression model
cat("\nLinear Regression Model (Body Fat ~ Age):\n")
print(summary(model))

cat("\n--- SUMMARY STATISTICS ---\n")
cat(sprintf("Age    - Mean: %.2f, Median: %.2f, SD: %.2f\n", age_mean, age_median, age_sd))
cat(sprintf("BodyFat- Mean: %.2f, Median: %.2f, SD: %.2f\n", bodyfat_mean, bodyfat_median, bodyfat_sd))
cat(sprintf("Correlation: %.4f\n\n", correlation))

###############################################################################
# END OF EXERCISE 5
###############################################################################

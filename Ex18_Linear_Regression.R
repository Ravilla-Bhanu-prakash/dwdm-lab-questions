###############################################################################
# EXERCISE 18: WATER DATASET - LINEAR REGRESSION
# Mortality vs Hardness
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 18 - LINEAR REGRESSION (Water Dataset)\n")
cat("="*80, "\n")

# Load water dataset
data(water)

cat("\nWater dataset loaded\n")
cat("Variables: mortality and hardness\n")
cat("Number of observations:", nrow(water), "\n\n")

# Descriptive statistics
cat("Summary Statistics:\n")
cat("Hardness:\n")
print(summary(water$hardness))
cat("\nMortality:\n")
print(summary(water$mortality))

# ============================================================================
# LINEAR REGRESSION MODEL
# ============================================================================

cat("\n--- LINEAR REGRESSION MODEL ---\n")

model <- lm(mortality ~ hardness, data=water)

cat("\nRegression Equation:\n")
print(summary(model))

# Extract coefficients
intercept <- coefficients(model)[1]
slope <- coefficients(model)[2]

cat(sprintf("\nModel Equation:\n"))
cat(sprintf("Mortality = %.4f + %.6f * Hardness\n\n", intercept, slope))

# ============================================================================
# PREDICTION FOR HARDNESS = 88
# ============================================================================

cat("Prediction for Hardness = 88:\n")
pred_mortality <- predict(model, newdata=data.frame(hardness=88))
cat(sprintf("Predicted Mortality = %.4f\n\n", pred_mortality))

# ============================================================================
# VISUALIZATION
# ============================================================================

cat("Creating scatter plot with regression line...\n\n")

plot(water$hardness, water$mortality,
     main="Mortality vs Water Hardness",
     xlab="Water Hardness",
     ylab="Mortality Rate",
     pch=19,
     col="darkblue",
     cex=1.2)

abline(model, col="red", lwd=2)

###############################################################################
# END OF EXERCISE 18
###############################################################################

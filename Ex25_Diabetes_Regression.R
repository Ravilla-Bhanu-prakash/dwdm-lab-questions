###############################################################################
# EXERCISE 25: DIABETES TREND ANALYSIS
# Linear and Multiple Regression
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 25 - DIABETES TREND ANALYSIS\n")
cat("="*80, "\n")

# Sample diabetes trend data
diabetes_trend <- data.frame(
  Age = c(25, 30, 35, 40, 45, 50, 55, 60),
  DiabetesLevel = c(85, 92, 100, 110, 125, 140, 155, 170),
  BMI = c(22, 24, 25, 27, 29, 31, 33, 35)
)

cat("\nDiabetes Trend Data:\n")
print(diabetes_trend)

# ============================================================================
# (a) LINEAR REGRESSION: Diabetes Level ~ Age
# ============================================================================

cat("\n--- LINEAR REGRESSION ---\n")
cat("Model: DiabetesLevel ~ Age\n\n")

model_linear <- lm(DiabetesLevel ~ Age, data=diabetes_trend)
print(summary(model_linear))

# ============================================================================
# (b) MULTIPLE REGRESSION: Diabetes Level ~ Age + BMI
# ============================================================================

cat("\n--- MULTIPLE REGRESSION ---\n")
cat("Model: DiabetesLevel ~ Age + BMI\n\n")

model_multiple <- lm(DiabetesLevel ~ Age + BMI, data=diabetes_trend)
print(summary(model_multiple))

# ============================================================================
# COMPARISON OF MODELS
# ============================================================================

cat("\n--- MODEL COMPARISON ---\n")
r2_linear <- summary(model_linear)$r.squared
r2_multiple <- summary(model_multiple)$r.squared

cat(sprintf("Linear Model R²:    %.6f\n", r2_linear))
cat(sprintf("Multiple Model R²:  %.6f\n\n", r2_multiple))

if(r2_multiple > r2_linear) {
  cat("Multiple regression explains more variance\n")
} else {
  cat("Linear regression is simpler with similar fit\n")
}

# ============================================================================
# VISUALIZATION
# ============================================================================

cat("\nCreating visualization...\n\n")

plot(diabetes_trend$Age, diabetes_trend$DiabetesLevel,
     main="Diabetes Level Trend",
     xlab="Age (years)",
     ylab="Diabetes Level",
     pch=19,
     col="darkred",
     cex=1.5)

abline(model_linear, col="blue", lwd=2)
legend("topleft", "Linear fit", col="blue", lty=1, lwd=2)

###############################################################################
# END OF EXERCISE 25
###############################################################################

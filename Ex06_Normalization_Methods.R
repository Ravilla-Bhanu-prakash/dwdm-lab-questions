###############################################################################
# EXERCISE 6: THREE NORMALIZATION METHODS FOR AGE = 35
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 6 - THREE NORMALIZATION METHODS (Age = 35)\n")
cat("="*80, "\n")

# Age data from Exercise 5
age_data <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
value <- 35

cat("\nAge Data:", age_data, "\n")
cat("Value to normalize: 35\n\n")

# Basic statistics
age_min <- min(age_data)
age_max <- max(age_data)
age_mean <- mean(age_data)
age_sd <- 12.94  # Given in exercise

cat("Min Age:", age_min, "\n")
cat("Max Age:", age_max, "\n")
cat("Mean Age:", round(age_mean, 2), "\n")
cat("SD Age:", age_sd, "\n\n")

# ============================================================================
# (i) MIN-MAX NORMALIZATION
# Formula: v' = (v - min) / (max - min)
# Range: [0.0, 1.0]
# ============================================================================

result_minmax <- (value - age_min) / (age_max - age_min)

cat("(i) MIN-MAX NORMALIZATION\n")
cat("Formula: v' = (v - min) / (max - min)\n")
cat(sprintf("Calculation: (%.0f - %.0f) / (%.0f - %.0f)\n", value, age_min, age_max, age_min))
cat(sprintf("           = %.0f / %.0f\n", value - age_min, age_max - age_min))
cat(sprintf("Result: %.4f\n\n", result_minmax))

# ============================================================================
# (ii) Z-SCORE NORMALIZATION
# Formula: v' = (v - mean) / std_dev
# Standardizes the value using mean and standard deviation
# ============================================================================

result_zscore <- (value - age_mean) / age_sd

cat("(ii) Z-SCORE NORMALIZATION\n")
cat("Formula: v' = (v - mean) / std_dev\n")
cat(sprintf("Mean: %.2f, SD: %.2f\n", age_mean, age_sd))
cat(sprintf("Calculation: (%.0f - %.2f) / %.2f\n", value, age_mean, age_sd))
cat(sprintf("           = %.4f / %.2f\n", value - age_mean, age_sd))
cat(sprintf("Result: %.4f\n\n", result_zscore))

# ============================================================================
# (iii) DECIMAL SCALING NORMALIZATION
# Formula: v' = v / 10^j
# Where j = ceiling(log10(max_absolute_value))
# ============================================================================

max_abs <- max(abs(age_data))
j <- ceiling(log10(max_abs))
result_decimal <- value / (10^j)

cat("(iii) DECIMAL SCALING NORMALIZATION\n")
cat("Formula: v' = v / 10^j\n")
cat("Where j = ceiling(log10(max_absolute_value))\n")
cat(sprintf("Max absolute value: %.0f\n", max_abs))
cat(sprintf("log10(%.0f) = %.4f\n", max_abs, log10(max_abs)))
cat(sprintf("j = ceiling(%.4f) = %d\n", log10(max_abs), j))
cat(sprintf("Calculation: %.0f / 10^%d = %.0f / %.0f\n", value, j, value, 10^j))
cat(sprintf("Result: %.4f\n\n", result_decimal))

# ============================================================================
# SUMMARY
# ============================================================================

cat("--- SUMMARY OF RESULTS ---\n")
cat(sprintf("Value (Age=35):\n"))
cat(sprintf("  Min-Max Normalized:        %.4f\n", result_minmax))
cat(sprintf("  Z-Score Normalized:       %.4f\n", result_zscore))
cat(sprintf("  Decimal Scaling:          %.4f\n\n", result_decimal))

###############################################################################
# END OF EXERCISE 6
###############################################################################

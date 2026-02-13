###############################################################################
# EXERCISE 3: MIN-MAX AND Z-SCORE NORMALIZATION
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 3 - NORMALIZATION METHODS\n")
cat("="*80, "\n")

# Given data
data3 <- c(200, 300, 400, 600, 1000)

cat("\nOriginal Data:", data3, "\n")
cat("Min:", min(data3), "Max:", max(data3), "\n")

# ============================================================================
# (a) MIN-MAX NORMALIZATION
# Formula: v' = (v - min) / (max - min)
# Result ranges from 0 to 1
# ============================================================================

min_val <- min(data3)
max_val <- max(data3)
range <- max_val - min_val

normalized_minmax <- (data3 - min_val) / range

cat("\n(a) MIN-MAX NORMALIZATION\n")
cat("Formula: v' = (v - min) / (max - min)\n")
cat("Range: [0, 1]\n\n")
cat("Calculations:\n")

for(i in seq_along(data3)) {
  cat(sprintf("  %d: (%.0f - %.0f) / (%.0f - %.0f) = %.0f / %.0f = %.4f\n", 
              i, data3[i], min_val, max_val, min_val, data3[i]-min_val, range, normalized_minmax[i]))
}

cat("\nMin-Max Normalized Data:", normalized_minmax, "\n")

# ============================================================================
# (b) Z-SCORE NORMALIZATION
# Formula: v' = (v - mean) / std_dev
# Centers data around 0, scales by standard deviation
# ============================================================================

mean_val <- mean(data3)
sd_val <- sd(data3)

normalized_zscore <- (data3 - mean_val) / sd_val

cat("\n(b) Z-SCORE NORMALIZATION\n")
cat("Formula: v' = (v - mean) / std_dev\n")
cat(sprintf("Mean: %.2f\n", mean_val))
cat(sprintf("Standard Deviation: %.4f\n\n", sd_val))
cat("Calculations:\n")

for(i in seq_along(data3)) {
  cat(sprintf("  %d: (%.0f - %.2f) / %.4f = %.4f\n", 
              i, data3[i], mean_val, sd_val, normalized_zscore[i]))
}

cat("\nZ-Score Normalized Data:", normalized_zscore, "\n")

# ============================================================================
# Summary Comparison
# ============================================================================

cat("\n--- SUMMARY ---\n")
cat("Original Data:        ", data3, "\n")
cat("Min-Max Normalized:   ", round(normalized_minmax, 4), "\n")
cat("Z-Score Normalized:   ", round(normalized_zscore, 4), "\n\n")

###############################################################################
# END OF EXERCISE 3
###############################################################################

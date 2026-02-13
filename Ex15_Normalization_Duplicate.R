###############################################################################
# EXERCISE 15: NORMALIZATION (Duplicate of Exercise 3)
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 15 - NORMALIZATION (Duplicate of Exercise 3)\n")
cat("="*80, "\n")

# Given data
data <- c(200, 300, 400, 600, 1000)

cat("\nOriginal Data:", data, "\n\n")
cat("See Exercise 3 for detailed calculations\n")

# Quick results
min_val <- min(data)
max_val <- max(data)
normalized_minmax <- (data - min_val) / (max_val - min_val)

mean_val <- mean(data)
sd_val <- sd(data)
normalized_zscore <- (data - mean_val) / sd_val

cat("\n(a) Min-Max Normalization [0,1]:\n")
cat(paste(round(normalized_minmax, 4), collapse=", "), "\n")

cat("\n(b) Z-Score Normalization:\n")
cat(paste(round(normalized_zscore, 4), collapse=", "), "\n\n")

###############################################################################
# END OF EXERCISE 15
###############################################################################

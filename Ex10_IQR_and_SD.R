###############################################################################
# EXERCISE 10: IQR AND STANDARD DEVIATION
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 10 - IQR AND STANDARD DEVIATION\n")
cat("="*80, "\n")

# Car speed data
speed <- c(78.3, 81.8, 82, 74.2, 83.4, 84.5, 82.9, 77.5, 80.9, 70.6)

cat("\nCar Speed Data (kph):\n")
cat(speed, "\n\n")

# ============================================================================
# QUARTILES AND IQR
# ============================================================================

q1 <- quantile(speed, 0.25)
q2 <- quantile(speed, 0.50)  # Median
q3 <- quantile(speed, 0.75)
iqr <- q3 - q1

cat("--- QUARTILES ---\n")
cat(sprintf("Q1 (25th percentile): %.2f\n", q1))
cat(sprintf("Q2 (50th percentile / Median): %.2f\n", q2))
cat(sprintf("Q3 (75th percentile): %.2f\n\n", q3))

cat(sprintf("IQR (Q3 - Q1) = %.2f - %.2f = %.2f\n\n", q3, q1, iqr))

# ============================================================================
# STANDARD DEVIATION
# ============================================================================

mean_val <- mean(speed)
sd_val <- sd(speed)
var_val <- var(speed)

cat("--- STANDARD DEVIATION ---\n")
cat(sprintf("Mean: %.2f\n", mean_val))
cat(sprintf("Variance: %.2f\n", var_val))
cat(sprintf("Standard Deviation: %.2f\n\n", sd_val))

# ============================================================================
# SUMMARY STATISTICS
# ============================================================================

cat("--- SUMMARY STATISTICS ---\n")
cat(sprintf("Min:          %.2f\n", min(speed)))
cat(sprintf("Q1:           %.2f\n", q1))
cat(sprintf("Median (Q2):  %.2f\n", q2))
cat(sprintf("Q3:           %.2f\n", q3))
cat(sprintf("Max:          %.2f\n", max(speed)))
cat(sprintf("IQR:          %.2f\n", iqr))
cat(sprintf("Mean:         %.2f\n", mean_val))
cat(sprintf("SD:           %.2f\n", sd_val))
cat(sprintf("Variance:     %.2f\n\n", var_val))

# Boxplot
boxplot(speed, 
        main="Boxplot of Car Speed",
        ylab="Speed (kph)",
        col="lightblue")

###############################################################################
# END OF EXERCISE 10
###############################################################################

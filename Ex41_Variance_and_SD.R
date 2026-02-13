###############################################################################
# EXERCISE 41: VARIANCE AND STANDARD DEVIATION
# Car Speed and Time Data
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 41 - VARIANCE AND STANDARD DEVIATION\n")
cat("="*80, "\n")

# Car speed and time data
avg_speed <- c(78, 81, 82, 74, 83, 82, 77, 80, 70)
total_time <- c(39, 37, 36, 42, 35, 36, 40, 38, 46)

cat("\nAverage Speed (kph):")
cat(paste(avg_speed, collapse=", "), "\n")
cat("Total Time (mins):")
cat(paste(total_time, collapse=", "), "\n\n")

# Create data frame
data <- data.frame(
  AvgSpeed = avg_speed,
  TotalTime = total_time
)

cat("Data Frame:\n")
print(data)

# ============================================================================
# (a) CALCULATE STANDARD DEVIATION
# ============================================================================

cat("\n(a) STANDARD DEVIATION\n")

sd_speed <- sd(avg_speed)
sd_time <- sd(total_time)

cat(sprintf("AvgSpeed SD:  %.4f\n", sd_speed))
cat(sprintf("TotalTime SD: %.4f\n\n", sd_time))

# ============================================================================
# (b) CALCULATE VARIANCE
# ============================================================================

cat("(b) VARIANCE\n")

var_speed <- var(avg_speed)
var_time <- var(total_time)

cat(sprintf("AvgSpeed Variance:  %.4f\n", var_speed))
cat(sprintf("TotalTime Variance: %.4f\n\n", var_time))

# ============================================================================
# SUMMARY STATISTICS
# ============================================================================

cat("--- SUMMARY STATISTICS ---\n\n")

cat("Average Speed (kph):\n")
cat(sprintf("  Mean:     %.2f\n", mean(avg_speed)))
cat(sprintf("  SD:       %.4f\n", sd_speed))
cat(sprintf("  Variance: %.4f\n\n", var_speed))

cat("Total Time (mins):\n")
cat(sprintf("  Mean:     %.2f\n", mean(total_time)))
cat(sprintf("  SD:       %.4f\n", sd_time))
cat(sprintf("  Variance: %.4f\n\n", var_time))

# Correlation
cor_val <- cor(avg_speed, total_time)
cat(sprintf("Correlation between Speed and Time: %.4f\n\n", cor_val))

###############################################################################
# END OF EXERCISE 41
###############################################################################

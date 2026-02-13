###############################################################################
# EXERCISE 20: OUTLIERS DETECTION USING BOXPLOT
# Tennis Player Points Scored
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 20 - OUTLIERS DETECTION\n")
cat("="*80, "\n")

# Example: Tennis player scores across multiple matches
points <- c(45, 42, 48, 50, 47, 49, 46, 48, 100, 51, 49, 50, 48, 47, 49)

cat("\nTennis Player Points Scored:\n")
cat(points, "\n\n")

# Calculate quartiles and IQR
q1 <- quantile(points, 0.25)
q3 <- quantile(points, 0.75)
iqr <- q3 - q1

# Calculate bounds for outliers
lower_bound <- q1 - 1.5*iqr
upper_bound <- q3 + 1.5*iqr

cat("--- OUTLIER DETECTION ---\n")
cat(sprintf("Q1 (25th percentile):  %.2f\n", q1))
cat(sprintf("Q3 (75th percentile):  %.2f\n", q3))
cat(sprintf("IQR:                   %.2f\n\n", iqr))

cat(sprintf("Lower Bound = Q1 - 1.5*IQR = %.2f - 1.5*%.2f = %.2f\n", q1, iqr, lower_bound))
cat(sprintf("Upper Bound = Q3 + 1.5*IQR = %.2f + 1.5*%.2f = %.2f\n\n", q3, iqr, upper_bound))

# Identify outliers
outliers <- points[points < lower_bound | points > upper_bound]

cat(sprintf("Outliers (outside range [%.2f, %.2f]):\n", lower_bound, upper_bound))
if(length(outliers) > 0) {
  cat(paste(outliers, collapse=", "), "\n")
} else {
  cat("None\n")
}
cat("\n")

# ============================================================================
# BOXPLOT VISUALIZATION
# ============================================================================

cat("Creating boxplot...\n\n")

boxplot(points,
        main="Tennis Player Points - Outlier Detection",
        ylab="Points Scored",
        col="lightblue",
        border="black")

grid(axis="y", col="gray", lty="dotted")

###############################################################################
# END OF EXERCISE 20
###############################################################################

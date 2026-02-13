###############################################################################
# EXERCISE 11: QUARTILES (Same as Exercise 2)
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 11 - QUARTILES\n")
cat("="*80, "\n")

# Data from Exercise 2
data <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

cat("\nData: First 10 values:", data[1:10], "... (27 total observations)\n\n")

# Calculate quartiles
q1 <- quantile(data, 0.25)
q2 <- quantile(data, 0.50)  # Median
q3 <- quantile(data, 0.75)

cat("--- QUARTILES ---\n")
cat(sprintf("Q1 (First Quartile, 25th percentile):  %.2f\n", q1))
cat(sprintf("Q2 (Second Quartile, 50th percentile): %.2f (Median)\n", q2))
cat(sprintf("Q3 (Third Quartile, 75th percentile):  %.2f\n\n", q3))

# IQR
iqr <- q3 - q1
cat(sprintf("IQR (Interquartile Range): %.2f\n\n", iqr))

# Visualization
boxplot(data, 
        main="Boxplot Showing Quartiles",
        ylab="Value",
        col="lightgreen")

###############################################################################
# END OF EXERCISE 11
###############################################################################

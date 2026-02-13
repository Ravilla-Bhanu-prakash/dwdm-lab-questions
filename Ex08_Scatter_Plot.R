###############################################################################
# EXERCISE 8: SCATTER PLOT - MOBILE PHONES SALES
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 8 - SCATTER PLOT (MOBILE PHONES SALES)\n")
cat("="*80, "\n")

# Given data
x <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)
y <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)

cat("\nData:\n")
cat("Mobile Phones Sold (x):", x, "\n")
cat("Money (y):", y, "\n")

cat("\nData points (x, y):\n")
for(i in 1:length(x)) {
  cat(sprintf("  (%2d, %3d)\n", x[i], y[i]))
}

# ============================================================================
# CREATE SCATTER PLOT
# ============================================================================

cat("\nCreating scatter plot with linear regression line...\n")

plot(x, y, 
     main="Mobile Phones Sold vs Revenue",
     xlab="Number of Mobile Phones Sold",
     ylab="Money ($)",
     pch=19,
     col="darkblue",
     cex=1.5,
     xlim=c(0, max(x)*1.1),
     ylim=c(0, max(y)*1.1))

grid(col="gray", lty="dotted")

# ============================================================================
# LINEAR REGRESSION ANALYSIS
# ============================================================================

cat("\n--- LINEAR REGRESSION ANALYSIS ---\n")

model <- lm(y ~ x)

# Add regression line to plot
abline(model, col="red", lwd=2)

cat("\nRegression Model Summary:\n")
print(summary(model))

# Extract coefficients
intercept <- coefficients(model)[1]
slope <- coefficients(model)[2]

cat(sprintf("\nRegression Equation:\n")
cat(sprintf("y = %.2f + %.4f * x\n", intercept, slope))
cat(sprintf("Money = %.2f + %.4f * (Phones Sold)\n\n", intercept, slope))

# R-squared
r_squared <- summary(model)$r.squared
cat(sprintf("R-squared: %.4f\n", r_squared))
cat(sprintf("This means %.2f%% of variance in Money is explained by Phones Sold\n\n", r_squared*100))

###############################################################################
# END OF EXERCISE 8
###############################################################################

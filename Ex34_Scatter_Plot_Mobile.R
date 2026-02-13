###############################################################################
# EXERCISE 34: SCATTER PLOT - MOBILE PHONES SALES
# (Duplicate of Exercise 8)
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 34 - SCATTER PLOT (Mobile Phones Sales)\n")
cat("="*80, "\n")

# Given data
x <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)
y <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)

cat("\nData Points (Phones Sold, Revenue):\n")
for(i in 1:length(x)) {
  cat(sprintf("  (%2d, %3d)\n", x[i], y[i]))
}

# ============================================================================
# SCATTER PLOT
# ============================================================================

cat("\nCreating scatter plot...\n\n")

plot(x, y,
     main="Mobile Phones Sold vs Revenue",
     xlab="Number of Mobile Phones Sold",
     ylab="Revenue ($)",
     pch=19,
     col="darkblue",
     cex=1.5)

# Add regression line
model <- lm(y ~ x)
abline(model, col="red", lwd=2)

###############################################################################
# END OF EXERCISE 34
###############################################################################

###############################################################################
# EXERCISE 19: BOXPLOT FOR MTCARS
# MPG vs Number of Cylinders
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 19 - GROUPED BOXPLOT (MPG vs Cylinders)\n")
cat("="*80, "\n")

# Load mtcars dataset
data(mtcars)

cat("\nmtcars dataset loaded\n")
cat("Variables:\n")
cat("  MPG (Miles Per Gallon)\n")
cat("  CYL (Number of Cylinders)\n\n")

cat("Unique cylinder values:", unique(mtcars$cyl), "\n\n")

# Summary by group
cat("Summary Statistics by Cylinder Group:\n")
for(cyl in sort(unique(mtcars$cyl))) {
  mpg_subset <- mtcars$mpg[mtcars$cyl == cyl]
  cat(sprintf("\n%d Cylinders (n=%d):\n", cyl, length(mpg_subset)))
  cat(sprintf("  Mean:   %.2f\n", mean(mpg_subset)))
  cat(sprintf("  Median: %.2f\n", median(mpg_subset)))
  cat(sprintf("  SD:     %.2f\n", sd(mpg_subset)))
}

# ============================================================================
# BOXPLOT VISUALIZATION
# ============================================================================

cat("\n\nCreating grouped boxplot...\n\n")

boxplot(mpg ~ cyl, 
        data=mtcars,
        main="MPG by Number of Cylinders",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon (MPG)",
        col=c("lightblue", "lightcoral", "lightgreen"),
        border="black")

grid(axis="y", col="gray", lty="dotted")

###############################################################################
# END OF EXERCISE 19
###############################################################################

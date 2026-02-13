###############################################################################
# EXERCISE 14: CLASS PERFORMANCE COMPARISON
# Two Maths Classes Year 9 Exam Results
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 14 - CLASS PERFORMANCE COMPARISON\n")
cat("="*80, "\n")

# Year 9 exam results
classA <- c(76, 35, 47, 64, 95, 66, 89, 36, 84)
classB <- c(51, 56, 84, 60, 59, 70, 63, 66, 50)

cat("\nClass A Results:", classA, "\n")
cat("Class B Results:", classB, "\n\n")

# ============================================================================
# (i) CALCULATE MEAN, MEDIAN, AND RANGE
# ============================================================================

cat("(i) STATISTICS\n")
cat("Class A:\n")
cat(sprintf("  Mean:   %.2f\n", mean(classA)))
cat(sprintf("  Median: %.2f\n", median(classA)))
cat(sprintf("  Range:  %d (%.0f - %.0f)\n", max(classA)-min(classA), min(classA), max(classA)))

cat("\nClass B:\n")
cat(sprintf("  Mean:   %.2f\n", mean(classB)))
cat(sprintf("  Median: %.2f\n", median(classB)))
cat(sprintf("  Range:  %d (%.0f - %.0f)\n\n", max(classB)-min(classB), min(classB), max(classB)))

# Comparison
cat("COMPARISON:\n")
if(mean(classA) > mean(classB)) {
  cat(sprintf("Class A has higher mean (%.2f vs %.2f)\n", mean(classA), mean(classB)))
} else {
  cat(sprintf("Class B has higher mean (%.2f vs %.2f)\n", mean(classB), mean(classA)))
}

# ============================================================================
# (ii) BOXPLOT COMPARISON
# ============================================================================

cat("\nCreating boxplot comparison...\n\n")

boxplot(classA, classB,
        names=c("Class A", "Class B"),
        main="Year 9 Class Performance Comparison",
        ylab="Exam Marks",
        col=c("lightblue", "lightcoral"),
        border="black")

grid(axis="y", col="gray", lty="dotted")

###############################################################################
# END OF EXERCISE 14
###############################################################################

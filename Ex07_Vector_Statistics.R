###############################################################################
# EXERCISE 7: VECTOR OPERATIONS - PENCILS IN BOXES
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 7 - VECTOR OPERATIONS (PENCILS IN BOXES)\n")
cat("="*80, "\n")

# Number of pencils in 10 boxes
boxes <- c(9, 25, 23, 12, 11, 6, 7, 8, 9, 10)

cat("\nNumber of pencils in each box:\n")
for(i in 1:length(boxes)) {
  cat(sprintf("  Box %2d: %d pencils\n", i, boxes[i]))
}

# ============================================================================
# CALCULATE MEAN, MEDIAN, MODE
# ============================================================================

cat("\n--- STATISTICS ---\n")

# Mean
mean_val <- mean(boxes)
cat(sprintf("Mean: %.2f\n", mean_val))
cat(sprintf("  (Sum of all values / number of boxes)\n")
cat(sprintf("  ({paste(boxes, collapse='+')}) / 10 = {sum(boxes)} / 10 = {mean_val}\n\n")

# Median
median_val <- median(boxes)
cat(sprintf("Median: %.1f\n", median_val))
cat(sprintf("  (Middle value(s) when sorted)\n")
sorted_boxes <- sort(boxes)
cat(sprintf("  Sorted: {paste(sorted_boxes, collapse=', ')}\n\n")

# Mode (most frequent value)
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode_val <- get_mode(boxes)
freq_table <- table(boxes)

cat(sprintf("Mode: %.0f\n", mode_val))
cat("  (Most frequently occurring value)\n")
cat("  Frequency table:\n")
for(val in names(freq_table)) {
  cat(sprintf("    %s appears %s times\n", val, freq_table[val]))
}

cat("\n--- SUMMARY ---\n")
cat(sprintf("Mean:   %.2f pencils\n", mean_val))
cat(sprintf("Median: %.1f pencils\n", median_val))
cat(sprintf("Mode:   %.0f pencils\n\n", mode_val))

###############################################################################
# END OF EXERCISE 7
###############################################################################

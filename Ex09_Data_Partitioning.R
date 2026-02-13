###############################################################################
# EXERCISE 9: EQUAL-FREQUENCY AND EQUAL-WIDTH PARTITIONING
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 9 - DATA PARTITIONING\n")
cat("="*80, "\n")

# Given data (sorted)
marks <- c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75)
marks_sorted <- sort(marks)

cat("\nOriginal Data:", marks, "\n")
cat("Sorted Data:", marks_sorted, "\n")
cat("Number of observations:", length(marks_sorted), "\n\n")

# ============================================================================
# (a) EQUAL-FREQUENCY (EQUI-DEPTH) PARTITIONING INTO 3 BINS
# ============================================================================

n <- length(marks_sorted)
bin_freq_size <- n / 3

eq_freq_bin1 <- marks_sorted[1:floor(bin_freq_size)]
eq_freq_bin2 <- marks_sorted[(floor(bin_freq_size)+1):(2*floor(bin_freq_size))]
eq_freq_bin3 <- marks_sorted[(2*floor(bin_freq_size)+1):n]

cat("(a) EQUAL-FREQUENCY PARTITIONING (3 bins)\n")
cat(sprintf("Each bin should have approximately %.1f values\n\n", n/3))
cat(sprintf("Bin 1 (size %d): %s\n", length(eq_freq_bin1), paste(eq_freq_bin1, collapse=", ")))
cat(sprintf("Bin 2 (size %d): %s\n", length(eq_freq_bin2), paste(eq_freq_bin2, collapse=", ")))
cat(sprintf("Bin 3 (size %d): %s\n\n", length(eq_freq_bin3), paste(eq_freq_bin3, collapse=", ")))

# ============================================================================
# (b) EQUAL-WIDTH PARTITIONING INTO 3 BINS
# ============================================================================

bin_width <- (max(marks_sorted) - min(marks_sorted)) / 3
breaks <- c(min(marks_sorted), 
            min(marks_sorted) + bin_width,
            min(marks_sorted) + 2*bin_width,
            max(marks_sorted))

eq_width_bin1 <- marks_sorted[marks_sorted <= breaks[2]]
eq_width_bin2 <- marks_sorted[marks_sorted > breaks[2] & marks_sorted <= breaks[3]]
eq_width_bin3 <- marks_sorted[marks_sorted > breaks[3]]

cat("(b) EQUAL-WIDTH PARTITIONING (3 bins)\n")
cat(sprintf("Width of each bin: (%.0f - %.0f) / 3 = %.2f\n\n", max(marks_sorted), min(marks_sorted), bin_width))
cat(sprintf("Bin 1 (%.0f - %.2f): %s\n", breaks[1], breaks[2], paste(eq_width_bin1, collapse=", ")))
cat(sprintf("Bin 2 (%.2f - %.2f): %s\n", breaks[2]+0.01, breaks[3], paste(eq_width_bin2, collapse=", ")))
cat(sprintf("Bin 3 (%.2f - %.0f): %s\n\n", breaks[3]+0.01, breaks[4], paste(eq_width_bin3, collapse=", ")))

# ============================================================================
# HISTOGRAM VISUALIZATION
# ============================================================================

cat("Creating histograms...\n\n")

par(mfrow=c(1,2))

hist(marks_sorted, 
     main="Histogram of Marks",
     xlab="Marks",
     ylab="Frequency",
     breaks=5,
     col="lightblue",
     border="black")

hist(marks_sorted,
     main="Equal-Width Partitioning",
     xlab="Marks",
     ylab="Frequency",
     breaks=breaks,
     col="lightcoral",
     border="black")

par(mfrow=c(1,1))

###############################################################################
# END OF EXERCISE 9
###############################################################################

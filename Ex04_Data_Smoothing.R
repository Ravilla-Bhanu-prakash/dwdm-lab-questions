###############################################################################
# EXERCISE 4: DATA SMOOTHING (BIN MEAN, MEDIAN, BOUNDARIES)
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 4 - DATA SMOOTHING\n")
cat("="*80, "\n")

# Given data
data4 <- c(11, 13, 13, 15, 15, 16, 19, 20, 20, 20, 21, 21, 22, 23, 24, 30, 40, 45, 45, 45, 71, 72, 73, 75)

cat("\nOriginal Data:", data4, "\n")
cat("Total observations:", length(data4), "\n")

# Divide into 3 equal-frequency bins
bin_size <- length(data4) / 3
cat("Bin size:", bin_size, "\n\n")

bin1 <- data4[1:floor(bin_size)]
bin2 <- data4[(floor(bin_size)+1):(2*floor(bin_size))]
bin3 <- data4[(2*floor(bin_size)+1):length(data4)]

cat("Bin 1:", bin1, "\n")
cat("Bin 2:", bin2, "\n")
cat("Bin 3:", bin3, "\n")

# ============================================================================
# (a) SMOOTHING BY BIN MEAN
# Replace each value in a bin with the mean of the bin
# ============================================================================

bin1_mean <- mean(bin1)
bin2_mean <- mean(bin2)
bin3_mean <- mean(bin3)

data4_bin_mean <- c(rep(bin1_mean, length(bin1)), 
                    rep(bin2_mean, length(bin2)), 
                    rep(bin3_mean, length(bin3)))

cat("\n(a) SMOOTHING BY BIN MEAN\n")
cat(sprintf("  Bin 1 Mean: %.2f\n", bin1_mean))
cat(sprintf("  Bin 2 Mean: %.2f\n", bin2_mean))
cat(sprintf("  Bin 3 Mean: %.2f\n\n", bin3_mean))
cat("  Smoothed Data:", data4_bin_mean, "\n")

# ============================================================================
# (b) SMOOTHING BY BIN MEDIAN
# Replace each value in a bin with the median of the bin
# ============================================================================

bin1_median <- median(bin1)
bin2_median <- median(bin2)
bin3_median <- median(bin3)

data4_bin_median <- c(rep(bin1_median, length(bin1)), 
                      rep(bin2_median, length(bin2)), 
                      rep(bin3_median, length(bin3)))

cat("\n(b) SMOOTHING BY BIN MEDIAN\n")
cat(sprintf("  Bin 1 Median: %.2f\n", bin1_median))
cat(sprintf("  Bin 2 Median: %.2f\n", bin2_median))
cat(sprintf("  Bin 3 Median: %.2f\n\n", bin3_median))
cat("  Smoothed Data:", data4_bin_median, "\n")

# ============================================================================
# (c) SMOOTHING BY BIN BOUNDARIES
# Replace values with min/max values of the bin
# Lower half replaced with minimum, upper half with maximum
# ============================================================================

cat("\n(c) SMOOTHING BY BIN BOUNDARIES\n")
cat("  Replace each value with the boundary (min or max) of its bin\n")
cat(sprintf("  Bin 1: min=%.0f, max=%.0f\n", min(bin1), max(bin1)))
cat(sprintf("  Bin 2: min=%.0f, max=%.0f\n", min(bin2), max(bin2)))
cat(sprintf("  Bin 3: min=%.0f, max=%.0f\n\n", min(bin3), max(bin3)))

# For each bin, replace lower half with min, upper half with max
boundary1 <- c(rep(min(bin1), ceiling(length(bin1)/2)), 
               rep(max(bin1), floor(length(bin1)/2)))
boundary2 <- c(rep(min(bin2), ceiling(length(bin2)/2)), 
               rep(max(bin2), floor(length(bin2)/2)))
boundary3 <- c(rep(min(bin3), ceiling(length(bin3)/2)), 
               rep(max(bin3), floor(length(bin3)/2)))

data4_bin_boundary <- c(boundary1[1:length(bin1)], 
                        boundary2[1:length(bin2)], 
                        boundary3[1:length(bin3)])

cat("  Smoothed Data:", data4_bin_boundary, "\n")

# ============================================================================
# SUMMARY COMPARISON
# ============================================================================

cat("\n--- SUMMARY COMPARISON ---\n")
cat("Original:           ", data4, "\n")
cat("Smoothed (Mean):    ", round(data4_bin_mean, 2), "\n")
cat("Smoothed (Median):  ", round(data4_bin_median, 2), "\n")
cat("Smoothed (Boundary):", data4_bin_boundary, "\n\n")

###############################################################################
# END OF EXERCISE 4
###############################################################################

###############################################################################
# EXERCISE 13: DATA SMOOTHING WITH HISTOGRAMS
# All Electronics Prices
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 13 - DATA SMOOTHING WITH HISTOGRAMS\n")
cat("="*80, "\n")

# Sorted price data
prices <- c(1, 1, 5, 5, 5, 5, 5, 8, 8, 10, 10, 10, 10, 12, 14, 14, 14, 15, 15, 15, 
            15, 15, 15, 18, 18, 18, 18, 18, 18, 18, 18, 20, 20, 20, 20, 20, 20, 20, 
            21, 21, 21, 21, 25, 25, 25, 25, 25, 28, 28, 30, 30, 30)

cat("\nPrice Data (51 items, sorted):\n")
cat(prices, "\n\n")

# ============================================================================
# (i) EQUAL-FREQUENCY PARTITIONING WITH 3 BINS
# ============================================================================

n_items <- length(prices)
bin_size <- n_items / 3

bin1 <- prices[1:floor(bin_size)]
bin2 <- prices[(floor(bin_size)+1):(2*floor(bin_size))]
bin3 <- prices[(2*floor(bin_size)+1):n_items]

cat("(i) EQUAL-FREQUENCY PARTITIONING (3 bins)\n")
cat(sprintf("Bin 1 (size %2d): %d to %d\n", length(bin1), min(bin1), max(bin1)))
cat(sprintf("Bin 2 (size %2d): %d to %d\n", length(bin2), min(bin2), max(bin2)))
cat(sprintf("Bin 3 (size %2d): %d to %d\n\n", length(bin3), min(bin3), max(bin3)))

# ============================================================================
# (ii) DATA SMOOTHING USING BIN MEANS
# ============================================================================

mean1 <- mean(bin1)
mean2 <- mean(bin2)
mean3 <- mean(bin3)

cat("(ii) SMOOTHING BY BIN MEANS\n")
cat(sprintf("Bin 1 Mean: %.2f\n", mean1))
cat(sprintf("Bin 2 Mean: %.2f\n", mean2))
cat(sprintf("Bin 3 Mean: %.2f\n\n", mean3))

smoothed_mean <- c(rep(mean1, length(bin1)), 
                   rep(mean2, length(bin2)), 
                   rep(mean3, length(bin3)))

# ============================================================================
# VISUALIZATION WITH HISTOGRAMS
# ============================================================================

cat("Creating histograms...\n\n")

par(mfrow=c(2,1))

hist(prices, 
     main="Original Price Distribution",
     xlab="Price ($)",
     ylab="Frequency",
     breaks=10,
     col="lightblue",
     border="black")

hist(smoothed_mean,
     main="Smoothed by Bin Means",
     xlab="Price ($)",
     ylab="Frequency",
     breaks=5,
     col="lightcoral",
     border="black")

par(mfrow=c(1,1))

###############################################################################
# END OF EXERCISE 13
###############################################################################

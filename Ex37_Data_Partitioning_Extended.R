###############################################################################
# EXERCISE 37: DATA PARTITIONING
# Equal-Frequency, Equal-Width, and Clustering Methods
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 37 - DATA PARTITIONING (Extended)\n")
cat("="*80, "\n")

# Data
marks <- sort(c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75))

cat("\nData:", marks, "\n")
cat("Total observations:", length(marks), "\n\n")

# ============================================================================
# (a) EQUAL-FREQUENCY PARTITIONING
# ============================================================================

cat("(a) EQUAL-FREQUENCY PARTITIONING\n")
n <- length(marks)
bin_size <- n / 3

bin1 <- marks[1:floor(bin_size)]
bin2 <- marks[(floor(bin_size)+1):(2*floor(bin_size))]
bin3 <- marks[(2*floor(bin_size)+1):n]

cat(sprintf("Bin 1: %s\n", paste(bin1, collapse=", ")))
cat(sprintf("Bin 2: %s\n", paste(bin2, collapse=", ")))
cat(sprintf("Bin 3: %s\n\n", paste(bin3, collapse=", ")))

# ============================================================================
# (b) EQUAL-WIDTH PARTITIONING
# ============================================================================

cat("(b) EQUAL-WIDTH PARTITIONING\n")
bin_width <- (max(marks) - min(marks)) / 3

breaks <- c(min(marks), min(marks)+bin_width, min(marks)+2*bin_width, max(marks))
cat(sprintf("Breaks: %.1f, %.1f, %.1f, %.1f\n\n", breaks[1], breaks[2], breaks[3], breaks[4]))

# ============================================================================
# (c) CLUSTERING PARTITIONING
# ============================================================================

cat("(c) CLUSTERING PARTITIONING\n")
kmeans_part <- kmeans(marks, centers=3)

for(i in 1:3) {
  cluster_data <- marks[kmeans_part$cluster == i]
  cat(sprintf("Cluster %d: %s\n", i, paste(cluster_data, collapse=", ")))
}

###############################################################################
# END OF EXERCISE 37
###############################################################################

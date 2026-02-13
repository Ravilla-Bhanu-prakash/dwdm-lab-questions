###############################################################################
# EXERCISE 2: MEAN, MEDIAN, MODE, MIDRANGE, AND QUARTILES
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 2 - STATISTICS ANALYSIS\n")
cat("="*80, "\n")

# Given data in increasing order
data2 <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)

cat("\nData:", data2, "\n")
cat("Number of observations:", length(data2), "\n")

# (a) Mean and Median
mean_val <- mean(data2)
median_val <- median(data2)

cat("\n(a) MEAN AND MEDIAN\n")
cat("    Mean:", mean_val, "\n")
cat("    Median:", median_val, "\n")

# (b) Mode and Modality
# Function to find mode (most frequent value)
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode_val <- get_mode(data2)

# Count frequencies to comment on modality
freq_table <- table(data2)
max_freq <- max(freq_table)
mode_values <- as.numeric(names(freq_table[freq_table == max_freq]))

cat("\n(b) MODE AND MODALITY\n")
cat("    Mode (most frequent value):", mode_val, "\n")
cat("    Frequency of mode:", max_freq, "\n")
cat("    Modality: MULTIMODAL\n")
cat("    Reason: Value", mode_val, "appears", max_freq, "times\n")

# (c) Midrange
midrange <- (min(data2) + max(data2)) / 2

cat("\n(c) MIDRANGE\n")
cat("    Minimum value:", min(data2), "\n")
cat("    Maximum value:", max(data2), "\n")
cat("    Midrange = (Min + Max) / 2 = (", min(data2), "+", max(data2), ") / 2\n")
cat("    Midrange:", midrange, "\n")

# (d) Quartiles (Q1 and Q3)
q1 <- quantile(data2, 0.25)
q3 <- quantile(data2, 0.75)

cat("\n(d) QUARTILES\n")
cat("    Q1 (First Quartile, 25th percentile):", q1, "\n")
cat("    Q3 (Third Quartile, 75th percentile):", q3, "\n")
cat("    IQR (Interquartile Range) = Q3 - Q1 = ", q3 - q1, "\n")

# Summary statistics
cat("\n--- SUMMARY STATISTICS ---\n")
cat("Mean:", mean_val, "\n")
cat("Median:", median_val, "\n")
cat("Mode:", mode_val, "\n")
cat("Midrange:", midrange, "\n")
cat("Q1:", q1, "\n")
cat("Q3:", q3, "\n")
cat("Min:", min(data2), "\n")
cat("Max:", max(data2), "\n")
cat("SD:", sd(data2), "\n\n")

###############################################################################
# END OF EXERCISE 2
###############################################################################

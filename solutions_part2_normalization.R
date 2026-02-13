# CSA16 DATA WAREHOUSE AND DATA MINING - PART 2
# Normalization and Data Preprocessing Exercises

# ============================================================================
# EXERCISE 1: Approximate Median from Grouped Data
# ============================================================================
cat("EXERCISE 1 - Approximate Median from Grouped Data\n")
cat("=".repeat(50), "\n")

# Age intervals and frequencies
age_intervals <- data.frame(
  interval = c("1-5", "5-15", "15-20", "20-50", "50-80", "80-110"),
  lower = c(1, 5, 15, 20, 50, 80),
  upper = c(5, 15, 20, 50, 80, 110),
  frequency = c(200, 450, 300, 1500, 700, 44)
)

# Calculate cumulative frequency
age_intervals$cumulative_freq <- cumsum(age_intervals$frequency)
total_freq <- sum(age_intervals$frequency)
median_position <- total_freq / 2

cat("Age Interval\tFrequency\tCumulative Frequency\n")
print(age_intervals[, c(1, 4, 5)])

cat("\nTotal Frequency:", total_freq, "\n")
cat("Median Position:", median_position, "\n")

# Find median class
median_class_idx <- which(age_intervals$cumulative_freq >= median_position)[1]
median_class <- age_intervals[median_class_idx, ]

# Interpolation formula: Median = L + ((n/2 - CF) / f) * h
L <- median_class$lower
CF <- ifelse(median_class_idx == 1, 0, age_intervals$cumulative_freq[median_class_idx - 1])
f <- median_class$frequency
h <- median_class$upper - median_class$lower

median_value <- L + ((median_position - CF) / f) * h
cat("\nMedian Class:", median_class$interval, "\n")
cat("Approximate Median Value:", median_value, "\n\n")

# ============================================================================
# EXERCISE 3: Min-Max and Z-Score Normalization
# ============================================================================
cat("EXERCISE 3 - Normalization Methods\n")
cat("=".repeat(50), "\n")

data3 <- c(200, 300, 400, 600, 1000)

# (a) Min-Max Normalization: v' = (v - min) / (max - min)
min_val <- min(data3)
max_val <- max(data3)
normalized_minmax <- (data3 - min_val) / (max_val - min_val)

cat("Original Data:", data3, "\n")
cat("Min:", min_val, "Max:", max_val, "\n")
cat("\n(a) Min-Max Normalization (Range: 0-1):\n")
for(i in seq_along(data3)) {
  cat(sprintf("  %d -> %.4f\n", data3[i], normalized_minmax[i]))
}

# (b) Z-Score Normalization: v' = (v - mean) / std_dev
mean_val <- mean(data3)
sd_val <- sd(data3)
normalized_zscore <- (data3 - mean_val) / sd_val

cat("\n(b) Z-Score Normalization:\n")
cat("Mean:", mean_val, "SD:", sd_val, "\n")
for(i in seq_along(data3)) {
  cat(sprintf("  %d -> %.4f\n", data3[i], normalized_zscore[i]))
}
cat("\n")

# ============================================================================
# EXERCISE 6: Three Normalization Methods for Age = 35
# ============================================================================
cat("EXERCISE 6 - Three Normalization Methods for Age = 35\n")
cat("=".repeat(50), "\n")

# Using age data from Exercise 5
age_data <- c(23, 23, 27, 27, 39, 41, 47, 49, 50, 52, 54, 54, 56, 57, 58, 58, 60, 61)
value <- 35

cat("Age Data:", age_data, "\n")
cat("Value to normalize:", value, "\n\n")

# (i) Min-Max Normalization: v' = (v - min) / (max - min)
age_min <- min(age_data)
age_max <- max(age_data)
result_minmax <- (value - age_min) / (age_max - age_min)

cat("(i) Min-Max Normalization (Range 0.0 - 1.0):\n")
cat(sprintf("  Normalized value: %.4f\n\n", result_minmax))

# (ii) Z-Score Normalization: v' = (v - mean) / std_dev
age_mean <- mean(age_data)
age_sd <- 12.94  # Given in exercise
result_zscore <- (value - age_mean) / age_sd

cat("(ii) Z-Score Normalization:\n")
cat(sprintf("  Mean: %.2f, SD: %.2f\n", age_mean, age_sd))
cat(sprintf("  Normalized value: %.4f\n\n", result_zscore))

# (iii) Decimal Scaling Normalization: v' = v / 10^j
# where j is the minimum number of digits needed
max_abs <- max(abs(age_data))
j <- ceiling(log10(max_abs))
result_decimal <- value / (10^j)

cat("(iii) Decimal Scaling Normalization:\n")
cat(sprintf("  j = ceiling(log10(%.0f)) = %d\n", max_abs, j))
cat(sprintf("  Normalized value: %.4f\n\n", result_decimal))

# ============================================================================
# EXERCISE 15: Min-Max and Z-Score Normalization (Same as Exercise 3)
# ============================================================================
cat("EXERCISE 15 - Normalization (Same as Exercise 3)\n")
cat("=".repeat(50), "\n")

data15 <- c(200, 300, 400, 600, 1000)
cat("Data:", data15, "\n")

# Min-Max
min15 <- min(data15)
max15 <- max(data15)
norm_minmax15 <- (data15 - min15) / (max15 - min15)

cat("\n(a) Min-Max Normalization:\n")
for(i in seq_along(data15)) {
  cat(sprintf("  %d -> %.4f\n", data15[i], norm_minmax15[i]))
}

# Z-Score
mean15 <- mean(data15)
sd15 <- sd(data15)
norm_zscore15 <- (data15 - mean15) / sd15

cat("\n(b) Z-Score Normalization:\n")
for(i in seq_along(data15)) {
  cat(sprintf("  %d -> %.4f\n", data15[i], norm_zscore15[i]))
}
cat("\n")

# ============================================================================
# EXERCISE 40: Four Normalization Methods for Cricket Strike Rates
# ============================================================================
cat("EXERCISE 40 - Four Normalization Methods for Strike Rates\n")
cat("=".repeat(50), "\n")

strike_rates <- c(100, 70, 60, 90, 90)
sr_value <- 90  # We'll normalize one value as example

cat("Strike Rates:", strike_rates, "\n")
cat("Value to normalize: 90\n\n")

# (a) Min-Max Normalization
sr_min <- min(strike_rates)
sr_max <- max(strike_rates)
result_40a <- (sr_value - sr_min) / (sr_max - sr_min)

cat("(a) Min-Max Normalization:\n")
cat(sprintf("  Min: %d, Max: %d\n", sr_min, sr_max))
cat(sprintf("  Normalized: (90 - %d) / (%d - %d) = %.4f\n\n", sr_min, sr_max, sr_min, result_40a))

# (b) Z-Score Normalization
sr_mean <- mean(strike_rates)
sr_sd <- sd(strike_rates)
result_40b <- (sr_value - sr_mean) / sr_sd

cat("(b) Z-Score Normalization:\n")
cat(sprintf("  Mean: %.2f, SD: %.4f\n", sr_mean, sr_sd))
cat(sprintf("  Normalized: (90 - %.2f) / %.4f = %.4f\n\n", sr_mean, sr_sd, result_40b))

# (c) Z-Score using Mean Absolute Deviation (MAD)
mad_value <- mean(abs(strike_rates - sr_mean))
result_40c <- (sr_value - sr_mean) / mad_value

cat("(c) Z-Score using Mean Absolute Deviation:\n")
cat(sprintf("  Mean: %.2f, MAD: %.4f\n", sr_mean, mad_value))
cat(sprintf("  Normalized: (90 - %.2f) / %.4f = %.4f\n\n", sr_mean, mad_value, result_40c))

# (d) Decimal Scaling
sr_max_abs <- max(abs(strike_rates))
j_40 <- ceiling(log10(sr_max_abs))
result_40d <- sr_value / (10^j_40)

cat("(d) Decimal Scaling:\n")
cat(sprintf("  j = ceiling(log10(%.0f)) = %d\n", sr_max_abs, j_40))
cat(sprintf("  Normalized: 90 / 10^%d = %.4f\n\n", j_40, result_40d))

# ============================================================================
# EXERCISE 41: Standard Deviation and Variance Analysis
# ============================================================================
cat("EXERCISE 41 - Car Speed and Time Analysis\n")
cat("=".repeat(50), "\n")

avg_speed <- c(78, 81, 82, 74, 83, 82, 77, 80, 70)
total_time <- c(39, 37, 36, 42, 35, 36, 40, 38, 46)

cat("AvgSpeed (kph):", avg_speed, "\n")
cat("TotalTime (mins):", total_time, "\n\n")

# (a) Standard Deviation
sd_speed <- sd(avg_speed)
sd_time <- sd(total_time)

cat("(a) Standard Deviation:\n")
cat(sprintf("  AvgSpeed SD: %.4f\n", sd_speed))
cat(sprintf("  TotalTime SD: %.4f\n\n", sd_time))

# (b) Variance
var_speed <- var(avg_speed)
var_time <- var(total_time)

cat("(b) Variance:\n")
cat(sprintf("  AvgSpeed Variance: %.4f\n", var_speed))
cat(sprintf("  TotalTime Variance: %.4f\n\n", var_time))

# ============================================================================
# EXERCISE 12: Covariance and Correlation Analysis
# ============================================================================
cat("EXERCISE 12 - Age and Photograph Preference Analysis\n")
cat("=".repeat(50), "\n")

# Data from the exercise
pref_B <- c(18, 2, 20)
pref_C <- c(20, 40, 40)

cat("Photograph Preferences:\n")
cat("Age Group  B    C\n")
cat("5-6 yrs    18   20\n")
cat("7-8 yrs    2    40\n")
cat("9-10 yrs   20   40\n\n")

# (1) Covariance between B and C
cov_BC <- cov(pref_B, pref_C)
cat("(1) Sample Covariance between B and C:\n")
cat(sprintf("  Covariance: %.4f\n\n", cov_BC))

# (2) Covariance matrix
cov_matrix <- cov(data.frame(B=pref_B, C=pref_C))
cat("(2) Sample Covariance Matrix:\n")
print(cov_matrix)

# (3) Correlation between B and C
cor_BC <- cor(pref_B, pref_C)
cat("\n(3) Sample Correlation between B and C:\n")
cat(sprintf("  Correlation: %.4f\n\n", cor_BC))

# (4) Correlation matrix
cor_matrix <- cor(data.frame(B=pref_B, C=pref_C))
cat("(4) Sample Correlation Matrix:\n")
print(cor_matrix)
cat("\n")

# ============================================================================
# EXERCISE 13: Data Smoothing with Histograms
# ============================================================================
cat("EXERCISE 13 - All Electronics Prices Analysis\n")
cat("=".repeat(50), "\n")

prices <- c(1, 1, 5, 5, 5, 5, 5, 8, 8, 10, 10, 10, 10, 12, 14, 14, 14, 15, 15, 15, 
            15, 15, 15, 18, 18, 18, 18, 18, 18, 18, 18, 20, 20, 20, 20, 20, 20, 20, 
            21, 21, 21, 21, 25, 25, 25, 25, 25, 28, 28, 30, 30, 30)

# (i) Equal-frequency partitioning with 3 bins
n_items <- length(prices)
bin_size <- n_items / 3
bin1_13 <- prices[1:floor(bin_size)]
bin2_13 <- prices[(floor(bin_size)+1):(2*floor(bin_size))]
bin3_13 <- prices[(2*floor(bin_size)+1):n_items]

cat("(i) Equal-Frequency Partitioning (3 bins):\n")
cat("Bin 1 (Size", length(bin1_13), "):", min(bin1_13), "-", max(bin1_13), "\n")
cat("Bin 2 (Size", length(bin2_13), "):", min(bin2_13), "-", max(bin2_13), "\n")
cat("Bin 3 (Size", length(bin3_13), "):", min(bin3_13), "-", max(bin3_13), "\n\n")

# (ii) Data smoothing with bin means
mean1_13 <- mean(bin1_13)
mean2_13 <- mean(bin2_13)
mean3_13 <- mean(bin3_13)

smoothed_mean <- c(rep(mean1_13, length(bin1_13)), 
                   rep(mean2_13, length(bin2_13)), 
                   rep(mean3_13, length(bin3_13)))

cat("(ii) Smoothing by Bin Means:\n")
cat(sprintf("  Bin 1 Mean: %.2f\n", mean1_13))
cat(sprintf("  Bin 2 Mean: %.2f\n", mean2_13))
cat(sprintf("  Bin 3 Mean: %.2f\n\n", mean3_13))

# Smoothing by bin boundaries
boundary1 <- c(rep(min(bin1_13), ceiling(length(bin1_13)/2)), 
               rep(max(bin1_13), floor(length(bin1_13)/2)))
boundary2 <- c(rep(min(bin2_13), ceiling(length(bin2_13)/2)), 
               rep(max(bin2_13), floor(length(bin2_13)/2)))
boundary3 <- c(rep(min(bin3_13), ceiling(length(bin3_13)/2)), 
               rep(max(bin3_13), floor(length(bin3_13)/2)))

smoothed_boundary <- c(boundary1[1:length(bin1_13)], 
                       boundary2[1:length(bin2_13)], 
                       boundary3[1:length(bin3_13)])

cat("  Smoothing by Bin Boundaries:\n")
cat("  (Replace values with min or max of bin)\n\n")

# (iii) Histogram
par(mfrow=c(2,1))
hist(prices, main="Original Price Distribution", xlab="Price ($)", ylab="Frequency", breaks=10)
hist(smoothed_mean, main="Smoothed by Bin Means", xlab="Price ($)", ylab="Frequency", breaks=5)
par(mfrow=c(1,1))
cat("Histograms plotted.\n\n")

# ============================================================================
# Helper Function for repeated operations
# ============================================================================
repeat_char <- function(char, times) {
  paste(rep(char, times), collapse="")
}

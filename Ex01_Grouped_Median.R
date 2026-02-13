###############################################################################
# EXERCISE 1: APPROXIMATE MEDIAN FROM GROUPED DATA
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 1 - APPROXIMATE MEDIAN FROM GROUPED DATA\n")
cat("="*80, "\n")

# Given data: Age intervals and corresponding frequencies
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

cat("\nAge Interval\tFrequency\tCumulative Frequency\n")
print(age_intervals[, c(1, 4, 5)])

cat("\nTotal Frequency:", total_freq, "\n")
cat("Median Position (n/2):", median_position, "\n")

# Find the median class (first class where cumulative freq >= median position)
median_class_idx <- which(age_intervals$cumulative_freq >= median_position)[1]
median_class <- age_intervals[median_class_idx, ]

cat("\nMedian Class:", median_class$interval, "\n")

# Apply the median interpolation formula for grouped data:
# Median = L + ((n/2 - CF) / f) × h
# Where:
# L = Lower boundary of median class
# n/2 = Median position (total frequency / 2)
# CF = Cumulative frequency before median class
# f = Frequency of median class
# h = Class width (upper - lower)

L <- median_class$lower
CF <- ifelse(median_class_idx == 1, 0, age_intervals$cumulative_freq[median_class_idx - 1])
f <- median_class$frequency
h <- median_class$upper - median_class$lower

cat("L (Lower boundary):", L, "\n")
cat("CF (Cumulative freq before median class):", CF, "\n")
cat("f (Frequency of median class):", f, "\n")
cat("h (Class width):", h, "\n")

# Calculate median
median_value <- L + ((median_position - CF) / f) * h

cat("\n--- CALCULATION ---\n")
cat("Median = L + ((n/2 - CF) / f) × h\n")
cat(sprintf("Median = %d + ((%d - %d) / %d) × %d\n", L, median_position, CF, f, h))
cat(sprintf("Median = %d + (%.2f / %d) × %d\n", L, median_position - CF, f, h))
cat(sprintf("Median = %d + %.4f × %d\n", L, (median_position - CF) / f, h))
cat(sprintf("Median = %d + %.4f\n", L, ((median_position - CF) / f) * h))

cat("\n*** APPROXIMATE MEDIAN VALUE: ", median_value, " ***\n\n")

###############################################################################
# END OF EXERCISE 1
###############################################################################

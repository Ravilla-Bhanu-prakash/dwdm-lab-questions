###############################################################################
# EXERCISE 40: FOUR NORMALIZATION METHODS
# Cricket Strike Rates
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 40 - FOUR NORMALIZATION METHODS\n")
cat("="*80, "\n")

# Cricket strike rates
strike_rates <- c(100, 70, 60, 90, 90)
sr_value <- 90

cat("\nStrike Rates:", strike_rates, "\n")
cat("Value to normalize: 90\n\n")

# Basic statistics
sr_min <- min(strike_rates)
sr_max <- max(strike_rates)
sr_mean <- mean(strike_rates)
sr_sd <- sd(strike_rates)
sr_max_abs <- max(abs(strike_rates))

cat(sprintf("Min: %.1f, Max: %.1f, Mean: %.2f, SD: %.4f\n\n", sr_min, sr_max, sr_mean, sr_sd))

# ============================================================================
# (a) MIN-MAX NORMALIZATION
# ============================================================================

result_a <- (sr_value - sr_min) / (sr_max - sr_min)

cat("(a) MIN-MAX NORMALIZATION\n")
cat(sprintf("Formula: (v - min) / (max - min)\n"))
cat(sprintf("Result: (90 - %.1f) / (%.1f - %.1f) = %.4f\n\n", sr_min, sr_max, sr_min, result_a))

# ============================================================================
# (b) Z-SCORE NORMALIZATION
# ============================================================================

result_b <- (sr_value - sr_mean) / sr_sd

cat("(b) Z-SCORE NORMALIZATION\n")
cat(sprintf("Formula: (v - mean) / sd\n"))
cat(sprintf("Result: (90 - %.2f) / %.4f = %.4f\n\n", sr_mean, sr_sd, result_b))

# ============================================================================
# (c) Z-SCORE USING MEAN ABSOLUTE DEVIATION (MAD)
# ============================================================================

mad_value <- mean(abs(strike_rates - sr_mean))
result_c <- (sr_value - sr_mean) / mad_value

cat("(c) Z-SCORE USING MEAN ABSOLUTE DEVIATION\n")
cat(sprintf("Formula: (v - mean) / MAD\n"))
cat(sprintf("MAD: %.4f\n", mad_value))
cat(sprintf("Result: (90 - %.2f) / %.4f = %.4f\n\n", sr_mean, mad_value, result_c))

# ============================================================================
# (d) DECIMAL SCALING
# ============================================================================

j <- ceiling(log10(sr_max_abs))
result_d <- sr_value / (10^j)

cat("(d) DECIMAL SCALING NORMALIZATION\n")
cat(sprintf("Formula: v / 10^j, where j = ceiling(log10(max))\n"))
cat(sprintf("j = ceiling(log10(%.1f)) = %d\n", sr_max_abs, j))
cat(sprintf("Result: 90 / 10^%d = %.4f\n\n", j, result_d))

# ============================================================================
# SUMMARY
# ============================================================================

cat("--- SUMMARY OF RESULTS ---\n")
cat(sprintf("Min-Max:          %.4f\n", result_a))
cat(sprintf("Z-Score:          %.4f\n", result_b))
cat(sprintf("Z-Score (MAD):    %.4f\n", result_c))
cat(sprintf("Decimal Scaling:  %.4f\n\n", result_d))

###############################################################################
# END OF EXERCISE 40
###############################################################################

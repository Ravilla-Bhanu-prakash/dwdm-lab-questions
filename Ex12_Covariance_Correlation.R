###############################################################################
# EXERCISE 12: COVARIANCE AND CORRELATION ANALYSIS
# Age and Photograph Preference
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 12 - COVARIANCE AND CORRELATION\n")
cat("="*80, "\n")

# Given data: Children's preferences for photographs A, B, C by age
age_group <- c("5-6 years", "7-8 years", "9-10 years")
pref_A <- c(18, 2, 20)
pref_B <- c(22, 28, 10)
pref_C <- c(20, 40, 40)

cat("\nChildren's Preference Data:\n")
cat("Age Group    A    B    C\n")
cat("5-6 years   18   22   20\n")
cat("7-8 years    2   28   40\n")
cat("9-10 years  20   10   40\n\n")

# ============================================================================
# (1) SAMPLE COVARIANCE BETWEEN B AND C
# ============================================================================

cat("(1) SAMPLE COVARIANCE BETWEEN B AND C\n")
cov_bc <- cov(pref_B, pref_C)
cat(sprintf("    Covariance(B,C) = %.2f\n\n", cov_bc))

# ============================================================================
# (2) COVARIANCE MATRIX FOR ALL PREFERENCES
# ============================================================================

cat("(2) SAMPLE COVARIANCE MATRIX\n")
data_df <- data.frame(A=pref_A, B=pref_B, C=pref_C)
cov_matrix <- cov(data_df)
cat("    Covariance Matrix:\n")
print(cov_matrix)
cat("\n")

# ============================================================================
# (3) SAMPLE CORRELATION BETWEEN B AND C
# ============================================================================

cat("(3) SAMPLE CORRELATION BETWEEN B AND C\n")
cor_bc <- cor(pref_B, pref_C)
cat(sprintf("    Correlation(B,C) = %.4f\n\n", cor_bc))

# ============================================================================
# (4) CORRELATION MATRIX FOR ALL PREFERENCES
# ============================================================================

cat("(4) SAMPLE CORRELATION MATRIX\n")
cor_matrix <- cor(data_df)
cat("    Correlation Matrix:\n")
print(cor_matrix)
cat("\n")

###############################################################################
# END OF EXERCISE 12
###############################################################################

###############################################################################
# EXERCISE 33: VEGETARIAN COUNT ANALYSIS
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 33 - VEGETARIAN COUNT ANALYSIS\n")
cat("="*80, "\n")

# Data
persons <- c("Gopu", "Babu", "Baby", "Gopal", "Krishna", "Jai", "Dev", "Malini", "Hema", "Anu")
vegetarian <- c("yes", "yes", "yes", "no", "yes", "no", "no", "yes", "yes", "yes")

cat("\nPerson Data:\n")
for(i in 1:length(persons)) {
  cat(sprintf("%-10s: %s\n", persons[i], vegetarian[i]))
}

# ============================================================================
# COUNT VEGETARIANS AND NON-VEGETARIANS
# ============================================================================

veg_count <- sum(vegetarian == "yes")
non_veg_count <- sum(vegetarian == "no")

cat("\n--- COUNT ANALYSIS ---\n")
cat(sprintf("Total Vegetarians:     %d\n", veg_count))
cat(sprintf("Total Non-Vegetarians: %d\n", non_veg_count))
cat(sprintf("Total Persons:         %d\n\n", length(persons)))

# Percentage
cat(sprintf("Vegetarians:     %.1f%%\n", veg_count/length(persons)*100))
cat(sprintf("Non-Vegetarians: %.1f%%\n\n", non_veg_count/length(persons)*100))

# Which type has greater count
if(veg_count > non_veg_count) {
  cat(sprintf("Greater count: VEGETARIANS (%d > %d)\n", veg_count, non_veg_count))
} else if(non_veg_count > veg_count) {
  cat(sprintf("Greater count: NON-VEGETARIANS (%d > %d)\n", non_veg_count, veg_count))
} else {
  cat("Equal counts\n")
}

# ============================================================================
# VISUALIZATION
# ============================================================================

cat("\n\nCreating bar chart...\n\n")

barplot(c(veg_count, non_veg_count),
        names.arg=c("Vegetarian", "Non-Vegetarian"),
        main="Vegetarian vs Non-Vegetarian Count",
        ylab="Count",
        col=c("lightgreen", "lightcoral"),
        border="black")

###############################################################################
# END OF EXERCISE 33
###############################################################################

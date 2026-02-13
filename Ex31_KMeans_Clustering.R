###############################################################################
# EXERCISE 31: K-MEANS CLUSTERING
# Employee Data (Age, Salary, Credit Score)
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 31 - K-MEANS CLUSTERING\n")
cat("="*80, "\n")

# Employee data
employee_data <- data.frame(
  EmployeeID = c(111, 222, 333, 444, 555, 666),
  Gender = c("Male", "Male", "Female", "Female", "Female", "Male"),
  Age = c(28, 25, 26, 25, 30, 29),
  Salary = c(150000, 150000, 160000, 160000, 170000, 200000),
  Credit = c(39, 27, 42, 40, 64, 72)
)

cat("\nEmployee Data:\n")
print(employee_data)

# ============================================================================
# PERFORM K-MEANS CLUSTERING
# ============================================================================

cat("\n--- K-MEANS CLUSTERING ---\n")
cat("Clustering based on: Age, Salary, Credit Score\n")
cat("Number of clusters: 3\n\n")

# Prepare data for clustering (numeric columns only)
clustering_data <- employee_data[, c("Age", "Salary", "Credit")]

# Apply K-means with k=3
kmeans_result <- kmeans(clustering_data, centers=3, nstart=25)

# Add cluster assignments to data
employee_data$Cluster <- kmeans_result$cluster

cat("Clustering Results:\n")
print(employee_data)

# Cluster centers
cat("\n--- CLUSTER CENTERS ---\n")
print(kmeans_result$centers)

# Cluster sizes
cat("\n--- CLUSTER SIZES ---\n")
cat("Cluster 1:", sum(kmeans_result$cluster == 1), "employees\n")
cat("Cluster 2:", sum(kmeans_result$cluster == 2), "employees\n")
cat("Cluster 3:", sum(kmeans_result$cluster == 3), "employees\n\n")

# ============================================================================
# VISUALIZATION
# ============================================================================

cat("Creating cluster visualization...\n\n")

plot(employee_data$Age, employee_data$Salary,
     col=kmeans_result$cluster,
     main="Employee Clustering (Age vs Salary)",
     xlab="Age (years)",
     ylab="Salary ($)",
     pch=19,
     cex=3)

# Add cluster centers
points(kmeans_result$centers[, "Age"], 
       kmeans_result$centers[, "Salary"],
       col="red",
       pch="X",
       cex=3,
       lwd=3)

legend("topleft",
       legend=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster Center"),
       col=c(1, 2, 3, "red"),
       pch=c(19, 19, 19, "X"),
       cex=1.2)

###############################################################################
# END OF EXERCISE 31
###############################################################################

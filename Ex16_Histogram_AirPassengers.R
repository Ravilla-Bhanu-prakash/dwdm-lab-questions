###############################################################################
# EXERCISE 16: HISTOGRAM FOR AIRPASSENGERS DATASET
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 16 - AIRPASSENGERS HISTOGRAM\n")
cat("="*80, "\n")

# Load built-in AirPassengers dataset
data(AirPassengers)

cat("\nAirPassengers dataset loaded\n")
cat("Number of observations:", length(AirPassengers), "\n")
cat("Time period: 1949-1960 (monthly data)\n\n")

cat("Summary Statistics:\n")
cat(sprintf("Min:    %d\n", min(AirPassengers)))
cat(sprintf("Max:    %d\n", max(AirPassengers)))
cat(sprintf("Mean:   %.2f\n", mean(AirPassengers)))
cat(sprintf("Median: %.2f\n\n", median(AirPassengers)))

# Create histogram with specified breaks
cat("Creating histogram with breaks from 100 to 700, width 150...\n\n")

hist(AirPassengers, 
     breaks=seq(100, 700, by=150),
     main="AirPassengers Dataset",
     xlab="Number of Passengers",
     ylab="Frequency",
     col="lightblue",
     border="black",
     xlim=c(100, 700))

###############################################################################
# END OF EXERCISE 16
###############################################################################

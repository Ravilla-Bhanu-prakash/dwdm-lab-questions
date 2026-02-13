###############################################################################
# EXERCISE 17: MULTIPLE LINES IN LINE CHART (mtcars dataset)
# Using MPG and QSEC attributes
# CSA16 Data Warehouse and Data Mining
###############################################################################

cat("\n", "="*80, "\n")
cat("EXERCISE 17 - MULTIPLE LINES CHART\n")
cat("="*80, "\n")

# Load mtcars dataset
data(mtcars)

cat("\nmtcars dataset loaded\n")
cat("Number of cars:", nrow(mtcars), "\n\n")

cat("Attributes used:\n")
cat("  MPG (Miles Per Gallon)\n")
cat("  QSEC (Quarter-Mile Time in seconds)\n\n")

# Create multiple line chart
plot(mtcars$mpg, 
     type="l",
     col="blue",
     main="MPG and QSEC from mtcars Dataset",
     ylab="Value",
     xlab="Car Index",
     ylim=c(min(mtcars$qsec), max(mtcars$mpg)),
     lwd=2)

lines(mtcars$qsec, type="l", col="red", lwd=2)

legend("topleft", 
       legend=c("MPG (Miles Per Gallon)", "QSEC (Quarter-Mile Time)"),
       col=c("blue", "red"),
       lty=c(1, 1),
       lwd=2)

grid(col="gray", lty="dotted")

cat("Chart created with two lines:\n")
cat("  Blue line:  MPG\n")
cat("  Red line:   QSEC\n\n")

###############################################################################
# END OF EXERCISE 17
###############################################################################

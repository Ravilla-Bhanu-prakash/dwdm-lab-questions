# CSA16 DATA WAREHOUSE AND DATA MINING - PART 3
## Association Rule Mining, Classification, and Clustering Solutions

---

## EXERCISE 22: Apriori Algorithm and FP-Growth (Manual Setup)

### Given:
- Support threshold = 3
- Confidence threshold = 50%

### Approach:
1. Identify all itemsets with support ≥ 3
2. Generate rules from frequent itemsets
3. Filter rules by confidence ≥ 50%

**Implementation Note:** Use WEKA or R 'arules' package
```R
# R Implementation using arules package
install.packages("arules")
library(arules)

# Create transaction data
data_22 <- as(list(
  c("a", "d", "e"),
  c("a", "b", "c", "e"),
  c("a", "b", "d", "e"),
  c("a", "c", "d", "e"),
  c("b", "c", "e"),
  c("b", "d", "e"),
  c("c", "d"),
  c("a", "b", "c"),
  c("a", "d", "e"),
  c("a", "b", "e")
), "transactions")

# Apply Apriori
rules <- apriori(data_22, parameter = list(sup = 0.3, conf = 0.5, target = "rules"))
inspect(rules)
```

---

## EXERCISE 23: Association Rules Calculation

### Given Market Basket Data:
- 10 transactions with items {a,b,c,d,e,f,g,h,i,j,k...}

### Part (a): Maximum Number of Association Rules
**Formula:** 3^n - 2^(n+1) + 1
Where n = number of items

**For example, if we have 5 unique items:**
- Maximum itemsets = 2^5 - 1 = 31 (excluding empty set)
- Maximum rules ≈ 3^5 - 2^6 + 1 = 186

### Part (b): Maximum Size of Frequent Itemsets
**Answer:** Depends on support threshold
- Higher support → smaller itemsets
- With minsup > 0, theoretically any itemset size is possible
- Practically, usually limited by data sparsity

---

## EXERCISE 24: Bayes Classification with Training and Test Data

### Given Dataset:
| RID | age    | income  | student | credit_rating | Class:buys_computer |
|-----|--------|---------|---------|---------------|-------------------|
| 1   | ≤30    | high    | no      | fair          | no                |
| 2   | ≤30    | high    | no      | excellent     | no                |
| 3   | 31-40  | high    | no      | fair          | yes               |
| 4   | >40    | medium  | no      | fair          | yes               |
| 5   | >40    | low     | yes     | fair          | yes               |
| 6   | >40    | low     | yes     | excellent     | no                |
| 7   | 31-40  | low     | yes     | excellent     | yes               |
| 8   | ≤30    | medium  | no      | fair          | no                |
| 9   | ≤30    | low     | yes     | fair          | yes               |
| 10  | >40    | medium  | yes     | fair          | yes               |
| 11  | ≤30    | medium  | yes     | excellent     | yes               |
| 12  | 31-40  | medium  | no      | excellent     | yes               |
| 13  | 31-40  | high    | yes     | fair          | yes               |
| 14  | >40    | medium  | no      | excellent     | no                |

### Naive Bayes Solution Process:

1. **Calculate Prior Probabilities:**
   - P(buys_computer = yes) = 9/14 ≈ 0.643
   - P(buys_computer = no) = 5/14 ≈ 0.357

2. **Calculate Conditional Probabilities:**
   - For each attribute value, calculate P(attribute_value | Class)
   - Example: P(age=31-40 | yes) = 4/9 ≈ 0.444
   - P(age=31-40 | no) = 1/5 = 0.2

3. **For Test Instance (e.g., age=31-40, income=medium, student=yes):**
   - Calculate: P(yes) × P(age=31-40|yes) × P(income=medium|yes) × P(student=yes|yes)
   - Calculate: P(no) × P(age=31-40|no) × P(income=medium|no) × P(student=yes|no)
   - Classify as whichever has higher probability

### WEKA Implementation Steps:
1. Load dataset in WEKA
2. Go to **Classify** tab
3. Select **Naive Bayes** classifier
4. Use **10-fold cross-validation** or split data (66% train, 34% test)
5. Review confusion matrix and accuracy metrics

---

## EXERCISE 25: Diabetes Trend Analysis

### Expected Regression Models:

**Linear Regression Model:**
```
DiabetesLevel = β₀ + β₁(Age) + ε
```

**Multiple Regression Model:**
```
DiabetesLevel = β₀ + β₁(Age) + β₂(BMI) + β₃(BloodPressure) + ε
```

### R Implementation:
```R
# Load or create diabetes dataset
diabetes_df <- read.csv("diabetes.csv")

# Linear regression
model_linear <- lm(DiabetesLevel ~ Age, data = diabetes_df)
summary(model_linear)
plot(model_linear)

# Multiple regression
model_multiple <- lm(DiabetesLevel ~ Age + BMI + BloodPressure, data = diabetes_df)
summary(model_multiple)

# Compare models
anova(model_linear, model_multiple)

# Predictions
predict(model_multiple, newdata = data.frame(Age=50, BMI=28, BloodPressure=130))
```

---

## EXERCISE 26: WEKA Apriori Algorithm Implementation

### Given Transactions:
```
T1: {M, O, N, K, E, Y}
T2: {D, O, N, K, E, Y}
T3: {M, A, K, E}
T4: {M, U, C, K, Y}
T5: {C, O, O, K, I, E}
```

### Parameters:
- Min Support = 50% (2 transactions out of 5)
- Min Confidence = 80%

### Steps in WEKA:
1. Create ARFF file with transaction data
2. Go to **Preprocess** → Load data
3. Go to **Associate** tab
4. Select **Apriori** algorithm
5. Set Lower Bound Min Support = 0.4
6. Set Min Confidence = 0.8
7. Run and analyze results

### Expected Frequent Itemsets:
- {K, E} - Support: 4/5 = 80%
- {K, Y} - Support: 3/5 = 60%
- {K, E, Y} - Support: 2/5 = 40%
- {K, O} - Support: 2/5 = 40%
- {O, N, K, E, Y} - Support: 2/5 = 40%

### FP-Growth Tree Construction:
1. Scan database and create header table
2. Build FP-tree by inserting transactions
3. Mine patterns from tree

**FP-Growth Process:**
```
Header Table (sorted by support):
K: 5, E: 4, Y: 3, O: 3, N: 2, M: 3, ...

FP-Tree Structure:
    Root
    ├─ K [5]
    │  ├─ E [4]
    │  │  └─ Y [2]
    │  ├─ Y [1]
    │  └─ O [2]
    ├─ M [2]
    │  └─ A [1]
    └─ C [1]
       ├─ U [1]
       └─ O [1]
```

---

## EXERCISE 27: Decision Tree Classifier using WEKA

### WEKA Steps:
1. Load your dataset
2. **Classify** tab → Select **Trees** → **J48** (Decision Tree)
3. Set **Confidence factor**: 0.25 (default)
4. Set **Min instances per leaf**: 2
5. Choose **Test options**:
   - 10-fold cross-validation (recommended)
   - OR: Percentage split (usually 66/34)
   - OR: Supplied test set

6. Click **Start** to build tree
7. View **Preprocess** options to normalize if needed

### Logistic Regression:
1. Go to **Classify** → **Functions** → **Logistic**
2. Set parameters:
   - Ridge value: 1.0E-8
   - Max iterations: -1
3. Run with same test options

---

## EXERCISE 28: ARFF File Format and Association Rules

### ARFF Format Template:
```
@relation "market_basket"

@attribute item1 {yes, no}
@attribute item2 {yes, no}
@attribute item3 {yes, no}
@attribute item4 {yes, no}

@data
yes,no,yes,no
no,yes,yes,no
yes,yes,no,yes
no,yes,no,yes
yes,no,yes,no
yes,yes,yes,no
no,yes,yes,no
yes,yes,yes,yes
yes,no,yes,yes
no,yes,no,yes
```

### ARFF Format for Transaction Data:
```
@relation "transactions"

@attribute Transaction {T1, T2, T3, T4, T5, T6}
@attribute Items string

@data
T1,"Hot Dogs, Buns, Ketchup"
T2,"Hot Dogs, Buns"
T3,"Hot Dogs, Coke, Chips"
T4,"Chips, Coke"
T5,"Chips, Ketchup"
T6,"Hot Dogs, Coke, Chips"
```

### Analysis with min_sup = 33.33%, min_conf = 60%:

**Frequent Itemsets:**
- {Hot Dogs} - 4/6 = 66.67%
- {Coke} - 3/6 = 50%
- {Chips} - 4/6 = 66.67%
- {Hot Dogs, Coke} - 2/6 = 33.33%
- {Hot Dogs, Chips} - 2/6 = 33.33%
- {Coke, Chips} - 3/6 = 50%

**Strong Association Rules (conf ≥ 60%):**
- Rule 1: Chips → Coke (Confidence: 3/4 = 75%) ✓ **ACCEPTED**
- Rule 2: Coke → Chips (Confidence: 3/3 = 100%) ✓ **ACCEPTED**
- Rule 3: Hot Dogs → Coke (Confidence: 2/4 = 50%) ✗ **REJECTED**

---

## EXERCISE 29: Rule-based vs Decision Tree Classification

### WEKA Comparison Steps:

#### Decision Tree (J48):
1. Classify → Trees → J48
2. Cross-validate with 10-fold CV
3. Record: Accuracy, Precision, Recall, F-measure

#### Rule-based (OneR or JRip):
1. Classify → Rules → OneR (simple) or JRip (complex)
2. Cross-validate with 10-fold CV
3. Record: Accuracy, Precision, Recall, F-measure

#### Comparison:
```
Metric          | Decision Tree | Rule-based
===============|===============|============
Accuracy        | XX.XX%        | YY.YY%
Precision       | 0.XXX         | 0.YYY
Recall          | 0.XXX         | 0.YYY
F-measure       | 0.XXX         | 0.YYY
Number of Rules | N             | M
```

**Plot:** Bar chart comparing accuracies

---

## EXERCISE 30: Customer Segmentation using K-Means Clustering

### Problem Statement:
Segment mall customers into 5 clusters based on Annual Income and Spending Score:
1. **Usual Customers** - Low income, low spending
2. **Priority Customers** - High income, high spending
3. **Senior Citizen** - High income, low spending
4. **Young Target** - Low income, high spending
5. **Others** - Medium income, medium spending

### R Implementation:
```R
# Load customer data
customer_data <- read.csv("customer_data.csv")

# Select relevant features
features <- customer_data[, c("AnnualIncome", "SpendingScore")]

# Apply K-means with k=5
kmeans_result <- kmeans(features, centers = 5, nstart = 25)

# Assign clusters
customer_data$Cluster <- kmeans_result$cluster

# Visualize
plot(customer_data$AnnualIncome, customer_data$SpendingScore,
     col = kmeans_result$cluster, pch = 19,
     main = "Customer Segments", xlab = "Annual Income", ylab = "Spending Score")
points(kmeans_result$centers, col = 1:5, pch = 8, cex = 3)
legend("topleft", legend = c("Usual", "Priority", "Senior", "Young Target", "Others"),
       col = 1:5, pch = 19)

# Summary statistics
aggregate(customer_data[, c("AnnualIncome", "SpendingScore")], 
          by = list(customer_data$Cluster), mean)
```

### WEKA K-Means Steps:
1. Load customer data (CSV or ARFF)
2. **Unsupervised** tab → **Clustering** → **SimpleKMeans**
3. Set **Number of clusters = 5**
4. Set **Max iterations = 100**
5. Run and visualize results
6. Export cluster assignments

---

## EXERCISE 31: K-Means Clustering with CSV Data

### CSV File Format:
```
EmployeeID,Gender,Age,Salary,CreditScore
111,Male,28,150000,39
222,Male,25,150000,27
333,Female,26,160000,42
444,Female,25,160000,40
555,Female,30,170000,64
666,Male,29,200000,72
```

### WEKA Steps:
1. Open WEKA Explorer
2. **Preprocess** → Load CSV file
3. Go to **Unsupervised** → **Clustering** → **SimpleKMeans**
4. Set number of clusters to 2, 3, 4, 5 and compare
5. **Visualize** → Compare cluster silhouettes

### Cluster Visualization:
- Plot: Age vs Salary (colored by cluster)
- Plot: Age vs CreditScore (colored by cluster)
- Plot: Salary vs CreditScore (colored by cluster)

---

## EXERCISE 32: Naive Bayes vs SVM Classification

### Comparison Framework:

#### Naive Bayes:
```R
library(e1071)
model_nb <- naiveBayes(Class ~ ., data = train_data)
pred_nb <- predict(model_nb, test_data)
```

#### SVM (Support Vector Machine):
```R
model_svm <- svm(Class ~ ., data = train_data, kernel = "rbf")
pred_svm <- predict(model_svm, test_data)
```

#### Evaluation Metrics:
```R
# Confusion Matrix
table(actual, predicted)

# Accuracy
accuracy <- sum(diag(cm)) / sum(cm)

# Precision, Recall, F1-score
library(caret)
confusionMatrix(pred, actual)
```

### Comparison Table:
```
Metric              | Naive Bayes | SVM
==================|=============|=======
Accuracy           | XX.XX%      | YY.YY%
Precision          | 0.XXX       | 0.YYY
Recall             | 0.XXX       | 0.YYY
F1-Score           | 0.XXX       | 0.YYY
Training Time      | Fast        | Slow
Interpretability   | High        | Low
```

---

## EXERCISE 35: FP-Growth Algorithm Implementation

### Given Transactions:
```
T1: {Bread, Cheese, Egg, Juice}
T2: {Bread, Cheese, Juice}
T3: {Bread, Milk, Yogurt}
T4: {Bread, Juice, Milk}
T5: {Cheese, Juice, Milk}
```

### With min_sup = 50% (≥ 2.5 items), min_conf = 75%

### FP-Growth Algorithm Steps:

#### Step 1: Find Frequent 1-Itemsets
- Bread: 4/5 = 80% ✓
- Cheese: 3/5 = 60% ✓
- Juice: 4/5 = 80% ✓
- Milk: 3/5 = 60% ✓
- Egg: 1/5 = 20% ✗
- Yogurt: 1/5 = 20% ✗

#### Step 2: Build FP-Tree
- Sort items by support: Bread(4), Juice(4), Cheese(3), Milk(3)
- Insert transactions in order

#### Step 3: Mine FP-Tree
- Extract frequent 2-itemsets:
  - {Bread, Juice}: 3/5 = 60% ✓
  - {Bread, Cheese}: 2/5 = 40% ✗
  - {Bread, Milk}: 2/5 = 40% ✗
  - {Cheese, Juice}: 2/5 = 40% ✗
  - {Juice, Milk}: 2/5 = 40% ✗

#### Step 4: Generate Association Rules
- Rule: Bread → Juice
  - Support: 3/5 = 60%
  - Confidence: 3/4 = 75% ✓ **ACCEPTED**

- Rule: Juice → Bread
  - Confidence: 3/4 = 75% ✓ **ACCEPTED**

---

## EXERCISE 36: Decision Tree vs SVM for Diabetes Prediction

### WEKA Implementation:

#### Decision Tree (J48):
1. Load diabetes.csv
2. **Classify** → **Trees** → **J48**
3. **Test options**: 10-fold cross-validation
4. Click **Start**
5. Record metrics from output window

#### SVM (LibSVM):
1. Go to **Classify** → **Functions** → **LibSVM**
2. Set kernel: RBF
3. **Test options**: 10-fold cross-validation
4. Click **Start**
5. Record metrics

### Expected Output Example:
```
Decision Tree Results:
========================
Correctly Classified Instances: 675 (87.65%)
Incorrectly Classified Instances: 95 (12.35%)

Confusion Matrix:
        no   yes
no     425    45
yes     50   230

Accuracy:  87.65%
Precision (yes): 83.67%
Recall (yes):    82.14%
F1-Measure:      82.90%

SVM Results:
========================
Correctly Classified Instances: 682 (88.50%)
Incorrectly Classified Instances: 88 (11.50%)

Confusion Matrix:
        no   yes
no     430    40
yes     48   232

Accuracy:  88.50%
Precision (yes): 85.27%
Recall (yes):    82.86%
F1-Measure:      84.05%

Comparison: SVM slightly outperforms Decision Tree
```

---

## EXERCISE 37: Data Partitioning in R

### Script:
```R
# Data
marks <- c(55, 60, 71, 63, 55, 65, 50, 55, 58, 59, 61, 63, 65, 67, 71, 72, 75)
marks_sorted <- sort(marks)

# (a) Equal-Frequency Partitioning
n <- length(marks_sorted)
bin_size <- n / 3
bin1_freq <- marks_sorted[1:floor(bin_size)]
bin2_freq <- marks_sorted[(floor(bin_size)+1):(2*floor(bin_size))]
bin3_freq <- marks_sorted[(2*floor(bin_size)+1):n]

cat("Equal-Frequency Bins:\n")
cat("Bin 1:", bin1_freq, "\n")
cat("Bin 2:", bin2_freq, "\n")
cat("Bin 3:", bin3_freq, "\n\n")

# (b) Equal-Width Partitioning
bin_width <- (max(marks_sorted) - min(marks_sorted)) / 3
breaks <- c(min(marks_sorted), 
            min(marks_sorted) + bin_width,
            min(marks_sorted) + 2*bin_width,
            max(marks_sorted))

bin1_width <- marks_sorted[marks_sorted <= breaks[2]]
bin2_width <- marks_sorted[marks_sorted > breaks[2] & marks_sorted <= breaks[3]]
bin3_width <- marks_sorted[marks_sorted > breaks[3]]

cat("Equal-Width Bins:\n")
cat("Bin 1:", bin1_width, "\n")
cat("Bin 2:", bin2_width, "\n")
cat("Bin 3:", bin3_width, "\n\n")

# (c) Clustering partitioning
kmeans_result <- kmeans(marks_sorted, centers = 3)
cat("Clustering Partitions:\n")
for(i in 1:3) {
  cat("Cluster", i, ":", marks_sorted[kmeans_result$cluster == i], "\n")
}

# Histogram
par(mfrow=c(2,2))
hist(bin1_freq, main="Bin 1", xlab="Marks")
hist(bin2_freq, main="Bin 2", xlab="Marks")
hist(bin3_freq, main="Bin 3", xlab="Marks")
hist(marks_sorted, main="Overall Distribution", xlab="Marks", breaks=5)
par(mfrow=c(1,1))
```

---

## EXERCISE 38: Decision Tree from Diagram

### ARFF Format:
```
@relation "decision_tree_data"

@attribute Height {yes, no}
@attribute Weight {yes, no}
@attribute Gender {Male, Female}
@attribute Class {Male, Female}

@data
yes,yes,Male,Male
yes,no,Male,Male
no,yes,Female,Female
no,no,Male,Female
...
```

### WEKA Steps:
1. Create ARFF file
2. Load into WEKA
3. **Classify** → **Trees** → **J48**
4. Review generated tree (should match given diagram)
5. Generate rules using **Rule-based** classifiers
6. Compare confusion matrices

---

## EXERCISE 39: Apriori vs FP-Growth Comparison

### ARFF File for TV Brands:
```
@relation "TV_brands"

@attribute SONY {yes, no}
@attribute BPL {yes, no}
@attribute LG {yes, no}
@attribute SAMSUNG {yes, no}
@attribute ONIDA {yes, no}

@data
yes,yes,yes,no,no
no,yes,no,yes,no
no,yes,no,no,yes
yes,yes,no,yes,no
yes,no,no,no,yes
no,yes,no,no,yes
yes,no,no,no,yes
yes,yes,no,no,yes
yes,yes,no,no,yes
```

### With min_sup = 2, confidence = 50%:

#### Apriori Results:
- {BPL}: 6/9 = 67% (support = 6)
- {SONY}: 6/9 = 67% (support = 6)
- {SONY, BPL}: 4/9 = 44% (support = 4)
- {BPL, ONIDA}: 3/9 = 33% (support = 3)

#### Rules Generated:
1. SONY → BPL (conf = 4/6 = 67%) ✓
2. BPL → SONY (conf = 4/6 = 67%) ✓
3. BPL → ONIDA (conf = 3/6 = 50%) ✓

#### FP-Growth Results:
(Same frequent itemsets and rules as Apriori)

#### Unique Rules Comparison:
- **Both algorithms generate identical frequent itemsets**
- **Both generate same rules (deterministic)**
- **Difference in efficiency:**
  - Apriori: Uses multiple database scans
  - FP-Growth: Uses single tree structure (more efficient)

---

## EXERCISE 42: Association Rules with Metarule Format

### Given Transactions:
```
T100: {M, O, N, K, E, Y}
T200: {D, O, N, K, E, Y}
T300: {M, A, K, E}
T400: {M, U, C, K, Y}
T500: {C, O, O, K, I, E}
```

### Part (a): Apriori vs FP-Growth Comparison

**Steps:**
1. Set min_sup = 20% (1 transaction)
2. Run Apriori algorithm
3. Run FP-Growth algorithm
4. Compare itemsets and processing time

**Expected Frequent 2-Itemsets:**
- {K, E}: 4/5 = 80%
- {K, Y}: 3/5 = 60%
- {O, N}: 2/5 = 40%
- {O, K}: 2/5 = 40%
- {O, E}: 2/5 = 40%
- {K, O}: 2/5 = 40%

**Efficiency Comparison:**
- Apriori: 5 database scans for 3-itemsets
- FP-Growth: 1 database scan, tree mining

### Part (b): Strong Association Rules

**Metarule:** ∀X ∈ transaction, buys(X, item1) ∧ buys(X, item2) ⇒ buys(X, item3)

**Example Rules (with support s, confidence c):**

1. **{K, E} → Y**
   - Support: 2/5 = 40%
   - Confidence: 2/4 = 50%
   - Status: Depends on min_sup and min_conf

2. **{K, O} → E**
   - Support: 2/5 = 40%
   - Confidence: 2/2 = 100%
   - Status: Strong rule if min_conf ≤ 100%

3. **{O, N} → K**
   - Support: 2/5 = 40%
   - Confidence: 2/2 = 100%
   - Status: Strong rule

4. **{O, E} → K**
   - Support: 2/5 = 40%
   - Confidence: 2/2 = 100%
   - Status: Strong rule

---

## Key Formulas Reference

### Support and Confidence:
```
Support(X → Y) = Count(X ∪ Y) / Total Transactions
Confidence(X → Y) = Count(X ∪ Y) / Count(X)
Lift(X → Y) = Confidence(X → Y) / Support(Y)
```

### Statistical Measures:
```
Mean = Σx / n
Median = Middle value(s)
Mode = Most frequent value
Variance = Σ(x - mean)² / (n - 1)
Standard Deviation = √Variance
Covariance(X,Y) = Σ(x - x_mean)(y - y_mean) / (n - 1)
Correlation = Covariance(X,Y) / (SD_X × SD_Y)
```

### Normalization:
```
Min-Max: v' = (v - min) / (max - min)
Z-Score: v' = (v - mean) / std_dev
Decimal Scaling: v' = v / 10^j
```

---

## WEKA Installation and Usage Notes

### Download:
- Visit: https://www.cs.waikato.ac.nz/ml/weka/
- Download latest version
- Install Java if not already installed

### Basic Workflow:
1. **Load Data:** Preprocess tab → Open file (ARFF/CSV)
2. **Explore Data:** Visualization, statistics
3. **Preprocess:** Handle missing values, normalize, select features
4. **Classification:** Select algorithm, set parameters, run
5. **Evaluation:** Review accuracy, confusion matrix, ROC curve
6. **Visualization:** Plot results, compare algorithms

### Common Classifiers:
- **Trees:** J48, RandomForest, Decision Stump
- **Rules:** OneR, JRip, PART
- **Functions:** Logistic Regression, SVM, Neural Network
- **Probabilistic:** Naive Bayes, Bayesian Networks
- **Instance-based:** KNN, IBK

### Common Association Rules:
- **Apriori:** Fast, iterative
- **FP-Growth:** Efficient, tree-based
- **Eclat:** Vertical format mining

### Common Clustering:
- **SimpleKMeans:** Partitioning
- **EM:** Expectation-Maximization
- **Cobweb:** Hierarchical
- **DBSCAN:** Density-based

---

## R Package Recommendations

```R
# Statistical Analysis
install.packages(c("moments", "psych", "corrplot"))

# Machine Learning
install.packages(c("caret", "rpart", "randomForest", "e1071", "naivebayes"))

# Association Rules
install.packages(c("arules", "arulesViz"))

# Clustering
install.packages(c("cluster", "factoextra", "fpc"))

# Data Visualization
install.packages(c("ggplot2", "plotly", "gridExtra"))

# Data Preprocessing
install.packages(c("dplyr", "tidyr", "data.table"))
```

---

**Note:** All exercises can be implemented in R, WEKA, or Python depending on preference. R is recommended for statistical analysis, WEKA for data mining workflows, Python for large-scale implementations.

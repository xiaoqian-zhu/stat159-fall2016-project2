# Training and Testing Sets: this script is used for building the training and test sets. 

# Load the data
scaled_credit <- read.csv('data/datasets/scaled-credit.csv', header= TRUE)
scaled_credit$x <- NULL

set.seed(0)
sampleset <- sample(1:400, 300, replace = FALSE)

# Create the train set
train_set <- scaled_credit[sampleset, ]

# Create the test set
test_set <- scaled_credit[-sampleset, ]

# Save to the data file
save(train_set, test_set, file = "data/train-test-sets.RData")

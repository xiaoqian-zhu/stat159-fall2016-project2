library(glmnet)

# Loading train, test, and full data
load('../../data/train-test-sets.RData')
scaled_credit<- read.csv("../../data/datasets/scaled-credit.csv")
x_credit <- scaled_credit[,-12]
y_credit <- scaled_credit[,12]
x_train <- train_set[,-12]
y_train <- train_set[,12]
x_test <- test_set[,-12]
y_test <- test_set[,12]

# Fitting function on train set using ten-fold cross validation
set.seed(0)
grid <- 10^seq(10, -2, length = 100)
ridge_cv <- cv.glmnet(as.matrix(x_train), y_train, alpha = 0, lambda = grid, intercept = FALSE, standardize = FALSE)

# Finding best fitting lambda
ridge_min_lambda <- ridge_cv$lambda.min

# Plotting cross-validation errors
png('../../images/ridge-cross-validation-errors.png')
plot(ridge_cv)
dev.off()

# Computing test Mean Square Error using test set
source('../functions/mse-function.R')
ridge_predict <- predict(ridge_cv, as.matrix(x_test), s=ridge_min_lambda)
ridge_mse <- mse(ridge_predict,y_test)

# Refitting model on full data set using best fitting lambda
ridge_regression <- glmnet(as.matrix(x_credit), y_credit, alpha = 0, lambda = ridge_min_lambda, intercept = FALSE, standardize = FALSE)
ridge_coefficients <- coef(ridge_regression)

# Saving output to RData file
save(ridge_cv, ridge_min_lambda, ridge_mse, ridge_regression, ridge_coefficients, file = "../../data/ridge-regression.RData")

# Sinking output to txt file
sink('../../data/ridge-regression-output.txt')
cat('\nRidge best fitting lambda\n')
print(ridge_min_lambda)
cat('\nRidge test set MSE\n')
print(ridge_mse)
cat('\nRidge regression coefficients\n')
print(ridge_coefficients)
sink()



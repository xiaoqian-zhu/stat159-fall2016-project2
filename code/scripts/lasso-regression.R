library(glmnet)

# Load datasets
load('../../data/output/train-test-sets.RData')

scaled_credit<- read.csv("../../data/datasets/scaled-credit.csv")
scaled_credit$X <- NULL

x_train <- train_set[,-12]
y_train <- train_set[,12]

x_test <- test_set[,-12]
y_test <- test_set[,12]

x_credit <- scaled_credit[,-12]
y_credit <- scaled_credit[,12]

# Fit model on train data using ten-fold validation
set.seed(1)
grid <- 10^seq(10, -2, length = 100)
lasso_cv <- cv.glmnet(as.matrix(x_train), y_train, alpha = 1, lambda = grid, intercept = FALSE, standardize = FALSE)

# Get lambda for best fit model
lasso_min_lambda <- lasso_cv$lambda.min

# Plot cross-validation errors
png('../../images/lasso-cross-validation-errors.png')
plot(lasso_cv)
dev.off()

# Compute MSE from test set
source('../functions/mse-function.R')
lasso_predict <- predict(lasso_cv, as.matrix(x_test), s=lasso_min_lambda)
lasso_mse <- mse(lasso_predict,y_test)

# Fit previously found best model on full data
lasso_regression <- glmnet(as.matrix(x_credit), y_credit, alpha = 1, lambda = lasso_min_lambda, intercept = FALSE, standardize = FALSE)
lasso_coefficients <- coef(lasso_regression)

# Save output
save(lasso_cv, lasso_min_lambda, lasso_mse, lasso_regression, lasso_coefficients, file = "../../data/output/lasso-regression.RData")

# Sink output
sink('../../data/output/lasso-regression-output.txt')
cat('\nLasso best fitting lambda\n')
print(lasso_min_lambda)
cat('\nLasso test set MSE\n')
print(lasso_mse)
cat('\nLasso regression coefficients\n')
print(lasso_coefficients)
sink()

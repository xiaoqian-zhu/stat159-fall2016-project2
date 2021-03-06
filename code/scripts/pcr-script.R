# Library and load data
library(pls)
load('../../data/output/train-test-sets.RData')
scaled_credit <- read.csv('../../data/datasets/scaled-credit.csv')
scaled_credit$X <- NULL

set.seed(9991)
cv_pc <- pcr(Balance ~ ., data = train_set, validation = 'CV', scaled = TRUE)

# Finding Minimum Lambda
lambda_min_pc <- which.min(cv_pc$validation$PRESS)

# Plotting Ridge Regression
png('../../images/cv-pc-mse-plot.png')
validationplot(cv_pc, val.type = 'MSEP')
dev.off()

# Calculating the MSE
pc_predictions <- predict(cv_pc, ncomp = lambda_min_pc, newdata = test_set)
pc_mse <- mean((pc_predictions-test_set$Balance)^2)

# Re-Fitting the Model on the Full Data Set
pc_fit <- pcr(Balance ~ ., data = scaled_credit, ncomp = lambda_min_pc)
pc_coef_full <- coef(pc_fit)

# Saving Data and Generating an Output
save(lambda_min_pc, cv_pc, pc_mse, pc_coef_full,file = '../../data/output/pc-regression.RData')

sink('../../data/output/pc-regression-output.txt')
cat('Output of 10-fold Cross-Validation using PC Regression on the Train Data Set\n')
print(summary(cv_pc))
cat('\nMinimum Lambda that will help us find Best Model\n')
print(lambda_min_pc)
cat('\nPC MSE of Test Data Set\n')
print(pc_mse)
cat('\nOfficial Coefficients of Full Model using PC Regression\n')
print(pc_coef_full)
sink()

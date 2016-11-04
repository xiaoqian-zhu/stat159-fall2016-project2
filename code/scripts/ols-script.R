# Loading dataset
scaled_credit<- read.csv("../../data/datasets/scaled-credit.csv")
scaled_credit$X <- NULL

# Fitting ols regression and regression summary statistics
ols_regression <- lm(Balance ~ .,data = scaled_credit)
ols_summary <- summary(ols_regression)

# Regression coefficients
ols_coefficients <- coef(ols_regression)

# Computing MSE from ols regression
ols_mse <- mean(ols_regression$residuals^2)

# Saving output to RData file
save(ols_regression,ols_summary,ols_coefficients, ols_mse, file="../../data/output/ols-regression.RData")

# Sinking output to txt file
sink('../../data/output/ols-regression-output.txt')
cat('\nOLS regression summary statistics\n')
print(ols_summary)
cat('\nOLS MSE\n')
print(ols_mse)
cat('\nOLS regression coefficients\n')
print(ols_coefficients)
sink()
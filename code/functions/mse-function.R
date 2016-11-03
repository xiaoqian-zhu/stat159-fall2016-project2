# MSE function that computes the mean squared error
# Inputs: x predicted values, y actual values
# Output: Mean Squared Error

mse <- function(x,y){
  mean((x-y)^2)
}
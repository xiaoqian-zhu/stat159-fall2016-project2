# Setting up and context
require(testthat)
library(testthat)
library(pls)
source("../functions/mse-function.R")
context("Test for statistics calculated from mse function in pls and pcr regressions")

#load the regression for testing
reg <- plsr(mgp ~ disp + hp, data = mtcars)
ncomp <- 1

# Test the mse function if it is correct
test_that("Testing the mean_squared_error function to see if it is correct", {
  expect_equal(mean_squared_error(reg, mtcars$mpg, ncomp = ncomp), mean(reg$residuals[ , , 1]^2))
  expect_length(mean_squared_error(reg, mtcars$mpg, ncomp = ncomp), 1)
  expect_type(mean_squared_error(reg, mtcars$mpg, ncomp = ncomp), "double")
})

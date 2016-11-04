##Code:
This folder includes all the code scripts for this project. There are three subdirectories inside this folder, and one extra file `test-that.R` : `functions/`, `scripts/`, `tests/` and `test-that.R`.


-Functions:This folder has the file `ols-regression-functions.R` that includes all the functions we need in ols regression model and they all take an object of class `"lm"` as input and then compute values for $RSE$, $R^2$ and $F$-statistic. 
-Scripts:  
+ `eda-script.R` reads in the `Credit.csv` data set, and computes summary statistics, histograms for all the variables, matrix of correlations among all variables,and graphs, including barcharts of quantitative variables and boxplot of qualitative variables. The clearly labeled summary statistics and the matrix of correlations are saved in the file `eda-output.txt`. In turn, each exploratory chart is saved to `images` folder in PNG format.  
+`pre-modeling-script.R` reads in the `Credit.csv` data set and convert factors into dummy variables and mean centering and standardization. The processed data set is saved as `scaled-credit.csv` in `datasets` folder.
+ `training-testing-sets.R` reads in the `Credit.csv` data set, uses `sample` function to difinde the train set with a random sample of size 300 and also a test set with a size of 100. 
+`ols-script.R`, `Ridge-script.R`, `lasso-regression.R`, `pcr-script.R` and `pls-regression-script.R` respectively includes the sripts for performing ols, ridge, lasso, pc and pls regressions. `ols-script.R` uses the `lm()` function; `Ridge-script.R` and `lasso-regression.R` use package`glmnet`; `pcr-script.R` and `pls-regression-script.R` use package`pls`.
+ `session-info-script.R` is a script that includes `library()` calls to all the packages that we use for this homework, as well as the output of the function `sessionInfo()`. The output is saved via `sink()` to the file `session-info.txt`, which is at the  project's top level directory.  
-Tests: This folder has `mse-function-test.R` and `ols-regression-test.R` that includes all the functions we use in this project.
-test.that.R: This contains the general set up of the test-that functions for this project.
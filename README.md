## STAT 159 - Reproducible and Collaborative Data Science
### Project 2

**Authors**: Shirley Jin, Xiaoqian Zhu

**Objective**: The objective of this project is to recreate the predictive modeling process applied on the data set _Credit_ in Chapter 6: Linear Model Selection and Regularization of the book [**An Introduction to Statistical Learning**](http://www-bcf.usc.edu/~gareth/ISL/) authored by Gareth James.

**Structure**: The project file structure is that of the following:
```
stat159-fall2016-project2/
   README.md
   Makefile
   LICENSE
   session-info.txt
   .gitignore
   code/
      functions/
         mse-function.R
         ols-regression-functions.R
      scripts/
         eda-script.R
         pre-modeling-script.R
         training-testing-sets.R
         ols-script.R
         ridge-script.R
         lasso-regression.R
         pcr-script.R
         pls-regression-script.R
      tests/
         mse-function-test.R
         ols-regression-test.R
   data/
      datasets/
        Credit.csv
        scaled-credit.csv
      ...
   images/
      ...
   report/
      report.pdf
      report.Rmd
      sections/
         00-abstract.Rmd
         01-introduction.Rmd
         02-data.Rmd
         03-methods.Rmd
         04-analysis.Rmd
         05-results.Rmd
         06-conclusions.Rmd
   slides/
      ...
```

**Details**: Code folder contains 3 folders, scripts folder contains R script codes used to analyze the data, functions folder contains functions used to compute regression MSE and other statistics and tests folder contains the tests to verify the accuracy of functions. Data folder contains the main data set `Credit.csv` and and scaled dataset in datasets folder, as well as other important data stored using R. The project report is in the report folder. Slides about results are included in slides folder. `make` can be called to recreate the analysis.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

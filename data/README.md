## Data



-This folder contains two folders, `datasets` and `output`. 
-`datasets` includes `Credit.csv` and `scaled-credit.csv`.
+ `Creit.csv` is the main data setfor this project.The research and this data set are compiled by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani.  The file is downloaded from [Link to the data set](http://www-bcf.usc.edu/~gareth/ISL/Credit.csv). 
+ `scaled-credit.csv` is generated from `pre-modeling-script.R`.

-`output` incldues all the data output. 
+ `eda-output.txt` is a text file containing the summary statistics of all 
the variables, and the correlation matrix. This file is produced
via `sink()` from the `eda-script.R` file.  
+ `eda-correlation-matrix.RData` is an R's binary format file containing the
matrix of correlations among all variables. This file is produced 
via `save()` from the `eda-script.R` file.  
+ `ols-regression.RData`, `pc-regression.RData`, `lasso-regression.RData`, `ridge-regression.RData`, `pls-regression.RData` are R's binary format filescontaining the regression objects respectively obtained when running regression r scripts. 
+`ols-regression-output.txt`, `pc-regression-output.txt`, `lasso-regression-output.txt`, `ridge-regression-output.txt` and `pls-regression-output.txt` are the text file containing the summary statistics of all regression models. 
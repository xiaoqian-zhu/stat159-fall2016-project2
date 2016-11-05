# PHONY targets
.PHONY: all data premodel traintest tests eda ols ridge lasso pcr plsr regressions report slides session clean

# all
all: eda regressions report

# Abstract data
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv -o data/datasets/Credit.csv

premodel: code/scripts/pre-modeling-script.R
	cd code/scripts; Rscript pre-modeling-script.R

traintest: code/scripts/training-testing-sets.R
	cd code/scripts; Rscript training-testing-sets.R

# Running tests
tests: code/tests/test-regression.R
	cd code/tests; Rscript -e “library(testthat);test_file(‘test-regression.R’)”

# Running scripts
eda: code/scripts/eda-script.R data/datasets/Credit.csv
	cd code/scripts; Rscript eda-script.R

ols: code/scripts/ols-script.R data/datasets/scaled-credit.csv code/functions/mse-function.R
	cd code/scripts; Rscript ols-script.R

ridge: code/scripts/ridge-script.R data/datasets/scaled-credit.csv code/functions/mse-function.R
	cd code/scripts; Rscript ridge-script.R

lasso: code/scripts/lasso-regression.R data/datasets/scaled-credit.csv code/functions/mse-function.R
	cd code/scripts; Rscript lasso-regression.R

pcr: code/scripts/pcr-script.R data/datasets/scaled-credit.csv code/functions/mse-function.R
	cd code/scripts; Rscript pcr-script.R

plsr: code/scripts/pls-regression-script.R data/datasets/scaled-credit.csv code/functions/mse-function.R
	cd code/scripts; Rscript pls-regression-script.R

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

session: code/scripts/session-info-script.R
	cd code/scripts; Rscript session-info-script.R

#slides:
slides: slides/slides.Rmd
	Rscript -e "library(rmarkdown); render('slides/slides.Rmd')"


# Report to pdf
report: report/sections/*.Rmd
	cd report; cat sections/*.Rmd > report.Rmd; Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"

# Clean report
clean:
	rm -f report/report.pdf

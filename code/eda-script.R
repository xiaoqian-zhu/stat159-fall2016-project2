# Load data set
credit <- read.csv('data/Credit.csv', header = TRUE)
credit$X <- NULL

# Load necessary packages
library(ggplot2)

balance = credit$Balance
income = credit$Income
limit = credit$Limit
rating = credit$Rating
cards = credit$Cards
age = credit$Age
education = credit$Education
student = credit$Student
marriage = credit$Married
ethnicity = credit$Ethnicity
gender = credit$Gender

# Make data frames for quantitative variables
categories <- c(balance, income, limit, rating, cards, age, education)
sd <- c(sd(balance), sd(income), sd(limit), sd(rating), 
        sd(cards), sd(age), sd(education))
iqr <- c(IQR(balance), IQR(income), IQR(limit), IQR(rating), 
         IQR(cards), IQR(age), IQR(education))
range <- c(max(balance)-min(balance), 
           max(income)-min(income), 
           max(limit)-min(limit), 
           max(rating)-max(rating), 
           max(cards)-min(cards),
           max(age)-min(age),
           max(education)-min(education))
quan_var <- data.frame(categories, sd, iqr, range)

# Make data frames for qualitative variables
qual_var <- data.frame(gender, student, marriage, ethnicity)


# Sink to Eda Output file
sink('data/eda-output.txt')
cat('Quantitative Variable Information\n')
cat('\nSummary of Balance\n')
summary(credit$Balance)
cat('\nSummary of Income\n')
summary(credit$Income)
cat('\nSummary of Limit\n')
summary(credit$Limit)
cat('\nSummary of Rating\n')
summary(credit$Rating)
cat('\nSummary of Cards\n')
summary(credit$Cards)
cat('\nSummary of Age\n')
summary(credit$Age)
cat('\nSummary of Education\n')
summary(credit$Education)
cat('\nSummary of Other Descriptive Statistics\n')
print(qual_var)

# Histograms for Quantitative Variables
png('images/histogram-balance.png')
ggplot(data = credit) +
  geom_histogram(aes(Balance), binwidth = 250,
                 col = 'black',fill = 'blue') +
  xlab('Balance') +
  ylab('Count') +
  ggtitle('Histogram of Balance')
dev.off()

png('images/histogram-income.png')
ggplot(data = credit) +
  geom_histogram(aes(Income), binwidth = 35,
                 col = 'black',fill = 'blue') +
  xlab('Income') +
  ylab('Count') +
  ggtitle('Histogram of Income')
dev.off()

png('images/histogram-limit.png')
ggplot(data = credit) +
  geom_histogram(aes(Limit), binwidth = 2000,
                 col = 'black',fill = 'blue') +
  xlab('Limit') +
  ylab('Count') +
  ggtitle('Histogram of Limit')
dev.off()

png('images/histogram-rating.png')
ggplot(data = credit) +
  geom_histogram(aes(Rating), binwidth = 100,
                 col = 'black',fill = 'blue') +
  xlab('Rating') +
  ylab('Count') +
  ggtitle('Histogram of Rating')
dev.off()

png('images/histogram-cards.png')
ggplot(data = credit) +
  geom_histogram(aes(Cards), binwidth = 2,
                 col = 'black',fill = 'blue') +
  xlab('Cards') +
  ylab('Count') +
  ggtitle('Histogram of Cards')
dev.off()

png('images/histogram-age.png')
ggplot(data = credit) +
  geom_histogram(aes(Age), binwidth = 10,
                 col = 'black',fill = 'blue') +
  xlab('Age') +
  ylab('Count') +
  ggtitle('Histogram of Age')
dev.off()

png('images/histogram-education.png')
ggplot(data = credit) +
  geom_histogram(aes(Education), binwidth = 3,
                 col = 'black',fill = 'blue') +
  xlab('Education') +
  ylab('Count') +
  ggtitle('Histogram of Education')
dev.off()

# Boxplots for Quantitative Variables
png('images/boxplot-balance.png')
boxplot(balance, ylab = 'Frequency', main = 'Boxplot of Balance')
dev.off()

png('images/boxplot-income.png')
boxplot(income, ylab = 'Frequency', main = 'Boxplot of Income')
dev.off()

png('images/boxplot-limit.png')
boxplot(limit, ylab = 'Frequency', main = 'Boxplot of Limit')
dev.off()

png('images/boxplot-rating.png')
boxplot(rating, ylab = 'Frequency', main = 'Boxplot of Rating')
dev.off()

png('images/boxplot-cards.png')
boxplot(cards, ylab = 'Frequency', main = 'Boxplot of Cards')
dev.off()

png('images/boxplot-age.png')
boxplot(age, ylab = 'Frequency', main = 'Boxplot of Age')
dev.off()

png('images/boxplot-education.png')
boxplot(education, ylab = 'Frequency', main = 'Boxplot of Education')
dev.off()

# Correlations Matrix between Quantitative Variables
corr_matrix <- cor(quan_var)
print(corr_matrix)
sink()

# Scatterplot Matrix
png('images/scatterplot-matrix.png')
pairs(quant,pch = 16)
dev.off()

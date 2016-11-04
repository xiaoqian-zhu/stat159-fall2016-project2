# Load data set
credit <- read.csv('../../data/datasets/Credit.csv', header = TRUE)
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
quant <- data.frame(credit$Income, credit$Limit, credit$Rating, credit$Cards,
                    credit$Age, credit$Education, credit$Balance)

# Qualitative Variable Information Tables
# Gender
gender_freq <- table(credit$Gender)
gender_rel_freq <- gender_freq/nrow(credit)
gender_df <- data.frame(gender_freq, gender_rel_freq)
gender_df$Var1.1 <- NULL
colnames(gender_df) <- c('Gender', 'Frequency', 'Relative Frequency')

# Student
student_freq <- table(credit$Student)
student_rel_freq <- student_freq/nrow(credit)
student_df <- data.frame(student_freq, student_rel_freq)
student_df$Var1.1 <- NULL
colnames(student_df) <- c('Student?', 'Frequency', 'Relative Frequency')

# Married
married_freq <- table(credit$Married)
married_rel_freq <- married_freq/nrow(credit)
married_df <- data.frame(married_freq, married_rel_freq)
married_df$Var1.1 <- NULL
colnames(married_df) <- c('Married?', 'Frequency', 'Relative Frequency')

# Ethnicity
ethnicity_freq <- table(credit$Ethnicity)
ethnicity_rel_freq <- ethnicity_freq/nrow(credit)
ethnicity_df <- data.frame(ethnicity_freq, ethnicity_rel_freq)
ethnicity_df$Var1.1 <- NULL
colnames(ethnicity_df) <- c('Ethnicity', 'Frequency', 'Relative Frequency')


# Sink to Eda Output file
sink('../../data/output/eda-output.txt')
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
print(quant)
cat('\n\nQualitative Variable Tables\n')
cat('\nGender Table\n')
print(gender_df)
cat('\nStudent Table\n')
print(student_df)
cat('\nMarried Table\n')
print(married_df)
cat('\nEthnicity Table\n')
print(ethnicity_df)
cat('\n\nRelationship Between Balance and Qualitative Variables\n')
cat('\nAnova\n')
aov(Balance ~ Gender + Student + Married + Ethnicity, data = credit)
sink()



# Histograms for Quantitative Variables
png('../../images/histogram-balance.png')
ggplot(data = credit) +
  geom_histogram(aes(Balance), binwidth = 250,
                 col = 'black',fill = 'blue') +
  xlab('Balance') +
  ylab('Count') +
  ggtitle('Histogram of Balance')
dev.off()

png('../../images/histogram-income.png')
ggplot(data = credit) +
  geom_histogram(aes(Income), binwidth = 35,
                 col = 'black',fill = 'blue') +
  xlab('Income') +
  ylab('Count') +
  ggtitle('Histogram of Income')
dev.off()

png('../../images/histogram-limit.png')
ggplot(data = credit) +
  geom_histogram(aes(Limit), binwidth = 2000,
                 col = 'black',fill = 'blue') +
  xlab('Limit') +
  ylab('Count') +
  ggtitle('Histogram of Limit')
dev.off()

png('../../images/histogram-rating.png')
ggplot(data = credit) +
  geom_histogram(aes(Rating), binwidth = 100,
                 col = 'black',fill = 'blue') +
  xlab('Rating') +
  ylab('Count') +
  ggtitle('Histogram of Rating')
dev.off()

png('../../images/histogram-cards.png')
ggplot(data = credit) +
  geom_histogram(aes(Cards), binwidth = 2,
                 col = 'black',fill = 'blue') +
  xlab('Cards') +
  ylab('Count') +
  ggtitle('Histogram of Cards')
dev.off()

png('../../images/histogram-age.png')
ggplot(data = credit) +
  geom_histogram(aes(Age), binwidth = 10,
                 col = 'black',fill = 'blue') +
  xlab('Age') +
  ylab('Count') +
  ggtitle('Histogram of Age')
dev.off()

png('../../images/histogram-education.png')
ggplot(data = credit) +
  geom_histogram(aes(Education), binwidth = 3,
                 col = 'black',fill = 'blue') +
  xlab('Education') +
  ylab('Count') +
  ggtitle('Histogram of Education')
dev.off()

# Boxplots for Quantitative Variables
png('../../images/boxplot-balance.png')
boxplot(balance, ylab = 'Frequency', main = 'Boxplot of Balance')
dev.off()

png('../../images/boxplot-income.png')
boxplot(income, ylab = 'Frequency', main = 'Boxplot of Income')
dev.off()

png('../../images/boxplot-limit.png')
boxplot(limit, ylab = 'Frequency', main = 'Boxplot of Limit')
dev.off()

png('../../images/boxplot-rating.png')
boxplot(rating, ylab = 'Frequency', main = 'Boxplot of Rating')
dev.off()

png('../../images/boxplot-cards.png')
boxplot(cards, ylab = 'Frequency', main = 'Boxplot of Cards')
dev.off()

png('../../images/boxplot-age.png')
boxplot(age, ylab = 'Frequency', main = 'Boxplot of Age')
dev.off()

png('../../images/boxplot-education.png')
boxplot(education, ylab = 'Frequency', main = 'Boxplot of Education')
dev.off()

# Barchats for Qualitative Variables
png('../../images/barchart-gender.png')
barplot(table(credit$Gender), ylab = 'Count', xlab = 'Gender',
        col = 'red')
dev.off()

png('../../images/barchart-student.png')
barplot(table(credit$Student), ylab = 'Count', xlab = 'Student?',
        col = 'red')
dev.off()

png('../../images/barchart-married.png')
barplot(table(credit$Married), ylab = 'Count', xlab = 'Married?',
        col = 'red')
dev.off()

png('../../images/barchart-ethnicity.png')
barplot(table(credit$Ethnicity), ylab = 'Count', xlab = 'Ethnicity',
        col = 'red', ylim = c(0, 250))
dev.off()


# Correlations Matrix between Quantitative Variables
quant <- data.frame(credit$Income, credit$Limit, credit$Rating, credit$Cards,
                    credit$Age, credit$Education, credit$Balance)
correlation_matrix <- cor(quant)
correlation_matrix[lower.tri(correlation_matrix)] <- ''

sink('../../data/output/eda-correlation-matrix.txt')
print(corr_matrix)
sink()

# Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
pairs(quant,pch = 16)
dev.off()

# Boxplots relating Balance to Each of the Qualitative Variables
png('../../images/boxplot-gender.png')
ggplot(data = credit) +
  geom_boxplot(aes(x = Gender, y = Balance), fill = c('blue','red'))+
  ggtitle('Conditional Boxplot of Balance by Gender')
dev.off()

png('../../images/boxplot-student.png')
ggplot(data = credit) +
  geom_boxplot(aes(x = Student, y = Balance), fill = c('blue','red'))+
  ggtitle('Conditional Boxplot of Balance by Student')
dev.off()

png('../../images/boxplot-married.png')
ggplot(data = credit) +
  geom_boxplot(aes(x = Married, y = Balance), fill = c('blue','red'))+
  ggtitle('Conditional Boxplot of Balance by Married')
dev.off()

png('../../images/boxplot-ethnicity.png')
ggplot(data = credit) +
  geom_boxplot(aes(x = Ethnicity, y = Balance), 
               fill = c('blue','red', 'yellow'))+
  ggtitle('Conditional Boxplot of Balance by Ethnicity')
dev.off()


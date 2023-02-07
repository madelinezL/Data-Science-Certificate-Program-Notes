#Assignment 5
library(dplyr)
#Create the data frame
name = c ('Jacob', 'Isabella', 'Ethan', 'Sophia', 'Michael')
rank = c (1,1,2,2,3)
gender = c('boy', 'girl', 'boy', 'girl', 'boy')
year = c (2010, 2010, 2010, 2010, 2010)
df = data.frame(name, rank, gender, year)
df

#Print the structure of the Data Frame and show the output
str(df)

#Extract only the two columns name and gender
df[, c('name', 'gender')]

#Append to your data frame a column GPA with the following data: 2.5, 4.0, 3.6, 2.9, 3.9
GPA = c (2.5, 4.0, 3.6, 2.9, 3.9)
df$GPA = GPA
df

#Create a Subset with Rank greater or equal to 2
subset (df, subset = rank >= 2)


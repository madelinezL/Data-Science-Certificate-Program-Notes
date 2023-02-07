library(ggplot2)
#look at the data
iris

#look at the first a few rows of the data
head(iris)

#a quick glance of the dataset by using plot function
plot(iris)

#create a basic scatter plot graph of the relationship between petal length and petal width  
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()

#add the linear model
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()+stat_smooth(method='lm')

#add the title and group by color
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point(aes(color=Species))+stat_smooth(method='lm')
+labs(title=paste("The realtionship between petal length and petal width "))

#create a basic scatter plot graph of the relationship between sepal length and sepal width
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

#add the title and group by color
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point(aes(color=Species))
+labs(title=paste("The realtionship between sepal length and sepal width "))


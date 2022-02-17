# Hello World Part2!
# An Intro to coding in R
# A.J. Brown
# CSU Ag Water Quality Program
# ansley.brown@colostate.edu
# 17 Feb. 2022
# Source:


# For part 2, we will learn about packages, importing data, basic plotting, and
# linear models

# Loading Packages; always put this at the top of your script
# Remember to install the packages the first time you use them!
library(lattice)
library(ggplot2)
# It is better to use "library" to load a package because it provides a record in
# the code of packages were used.

# Importing data
## file.choose() allows files to be chosen interactively
## The other option is to specify the file path location
water.data <- read.csv(file.choose())
str(water.data)
View(water.data)
summary(water.data)
## R also has built in data for debugging purposes
data(mtcars)
summary(mtcars)

## Next line gives an error. We need to specify the data!
mean(no3)
## This is the correct format of this function:
mean(water.data$no3)
## "with" function allows for assuming a data set with a function
with(mean(no3), data = water.data)
attach(water.data)
mean(no3)
## Notice that after attaching, we do not need to use $
detach(water.data)
## Generally, it's not a good idea to detach your data, although possible
## Let's make a new column from other columns
water.data$total.N = water.data$no3 + water.data$tkn + water.data$nh4
water.data$total.N

# Basic Plotting

## using base-R: http://www.sthda.com/english/wiki/r-base-graphs
### scatter
plot(x=water.data$tp, y=water.data$tss)
plot(tss~tp, data=water.data)
### histogram
hist(water.data$no3)
### boxplot
boxplot(no3~Station, data=water.data)

## using lattice package: https://www.statmethods.net/advgraphs/trellis.html
xyplot(tss~tp, data=water.data, group = Station, auto.key=T)
xyplot(tss~tp|Station, data=water.data)
bwplot(no3~Station, data=water.data)
histogram(water.data$tp)

## using ggplot2: http://www.sthda.com/english/wiki/qplot-quick-plot-with-ggplot2-r-software-and-data-visualization
qplot(y=tss, x=tp, data=water.data) #NOTICE: no more Y~X format!
qplot(y=tss, x=tp, data=water.data, color=Station)
qplot(x=Station, y=no3, data=water.data, geom='boxplot')
qplot(x=tp, data=water.data, geom='histogram')

# linear models
## linear models in R use the following syntax:
### model.object = lm(Y~X, data = data)
model1 = lm(tss~tp, data=water.data)
print(model1)
summary(model1)
summary(plot(model1))
qplot(y=tss, x=tp, data=water.data) + stat_smooth(method='lm')

### let's use the new line to make a new column of predictions
water.data$tss.predictions <- predict(model1, data=water.data)
water.data$tss.predictions

### 1:1 plot to visually see how we did
qplot(y=tss, x=tss.predictions, data=water.data) + 
  stat_smooth(method='lm') +
  geom_abline(intercept = 0, slope = 1)
### the 1:1 line (black) lies within CI of regression line (blue); a great sign!

# Thank you for learning with me
# Cheers,
# A.J. Brown
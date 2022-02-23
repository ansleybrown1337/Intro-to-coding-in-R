# Hello World!
# An Intro to coding in R
# A.J. Brown
# CSU Ag Water Quality Program
# ansley.brown@colostate.edu
# 17 Feb. 2022
# Source: 

# This script is designed to teach users a basic introduction to coding in the
# R language.

# R is a command line programming language. It is useful for data analysis, and
# data visualization.  It also can do many other functions just like other
# coding languages like python, Java, C++, etc.

# Windows in Rstudio:
# top left = text editor
# top right = workspace/history window
# bottom left = console
# bottom right = files/plots/packages/help


# Let's run our first line of code!
# press Ctrl+Enter or Cmd+Enter (mac) to run a line of code
print('Hello World!')
print('the output will be displayed below in the console window') 
# Congratulations, you are now an R coder!

# Working directory: Where are we working?
getwd()

# Some examples of R commands
## Calculator
1+3^2 # not very useful without storing that data in a variable
x = 1+3^2
x # notice how this variable is saved in our environment (top left window)
y = x+2
y
z = "Greetings" # notice how " and ' are interchangeable for character types
z

## Data Types
?typeof() #Look, here's our first function! It uses inputs from us to do stuff

### Variable Types (0 Dimensional)
typeof(x) # numeric
typeof(z) # character
typeof(FALSE) # logical; note that T or F can also be used
typeof(3+2i) #complex
typeof(charToRaw('hello')) #raw

### Object Types
#### Vectors (1D)
###### Create a vector.
apple <- c('red','green',"yellow")
print(apple)

#### Lists (1D)
###### Create a list
list1 <- list(c(2,5,3),21.3,sin)
print(list1)

#### Matrices (2D; all the same data type)
##### Create a matrix
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)


#### Arrays (2+ Dimensions)
##### Create an array
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

#### Factors (2D)
##### Create a factor
###### Requires a vector.
apple.colors <- c('green','green','yellow','red','red','red','green')
###### Create a factor object.
factor.apple <- factor(apple.colors)
###### Print the factor.
print(factor.apple)
print(nlevels(factor.apple))

#### Data Frames (2D; store any data type)
##### Create a data frame
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

# So we can store some data, what's so cool about that?
# Functions and Logic
## Functions allow us to perform complex tasks easily and repetitively
num <- c(1:10) #shortcut to make a vector with #'s 1 - 10!
mean(num)
max(num)
min(num)
summary(num)
## Lets make our own function
new.function <- function(number.max) { # always use descriptive names!
  for(number in 1:number.max) {
    sq.number <- number^2
    print(sq.number)
  }
}
new.function(10)
## Logic

### If, else, ifelse()
logic.test <- 'a'
vector.a <- c('a', 1, 'cool')
vector.b <- c('foo','bar',3)
if(logic.test %in% vector.a){
  print('this item exists in vector.a')
} else if (logic.test %in% vector.b) {
  print('this item exists in vector.b')
} else {
  print('this item is nowhere to be found!')
}
#### ifelse() applies a function to many items at once; most "R-like" option
num <- c(-1:10)
ifelse(num >= 0, num^2, NA)
  
### While and for loops
####While
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}
####For
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1 # '%%' is the modulo operator
}
print(count)
  
# Thank you for learning with me
# Cheers,
# A.J. Brown  


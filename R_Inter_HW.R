#1.Describe the values stored in the object output. In other words what did the loops create?
        #The means of the sepal and petal measurements
#2. 



data(iris)
head(iris)

## 
sp_ids = unique(iris$Species)

##create a unique species id

output = matrix(0, nrow=length(sp_ids), ncol=ncol(iris)-1)
rownames(output) = sp_ids
colnames(output) = names(iris[ , -ncol(iris)])

## create an empty matrix with named columns and rows 

for(i in seq_along(sp_ids)) {
    ## create a for loop that loops throught the species ids
    iris_sp = subset(iris, subset=Species == sp_ids[i], select=-Species)
    ## subsets that outputs the data for a species then moves to the next species 
    for(j in 1:(ncol(iris_sp))) {
      ## creates a loop that counts from one to the species 
        x = 0
        y = 0
      ## set the variables x and y to = zero if the species is greater than zero 
        if (nrow(iris_sp) > 0) {
            for(k in 1:nrow(iris_sp)) {
                x = x + iris_sp[k, j]
                y = y + 1
            }
            output[i, j] = x / y 
        }
    }
}
output





##3.) Rename Output, x, and y.


##4.) Suggest a a way to get the output with one less loop by 1





##You have a vector x with the numbers 1:10. Write a for loop that will produce a vector y that contains the sum of x up to that index of x. So for example the elements of x are 1, 2, 3, and so on and the elements of y would be 1, 3, 6, and so on.

current.sum = 0


for(i in 1:10) {
  current.sum = current.sum + i
}

##Modify your for loop so that if the sum is greater than 10 the value of y is set to NA

current.sum = 0


for(i in 1:10) {
  current.sum = current.sum + i
    
    if(current.sum > 10)
  }

##Place your for loop into a function that accepts as its argument any vector of arbitrary length and it will return y.



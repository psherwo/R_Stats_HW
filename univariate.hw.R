# download and import locally
> trees <- read.csv('./data/treedata_subset.csv')

# examine how the data is structured
str(trees)

#load packages
library(ggplot2)
library(gridExtra)
library(scatterplot3d)
library(MASS)

#change format from long to wide form

treecov <- tapply(trees$cover, list(trees$plotID, trees$species), mean)
# change NAs to zeros

treecov <- ifelse(is.na(treecov), 0, treecov)

# subset the data frame to just include the two target species

treecov.subset = treecov[ , c(1, 4)] 
cover.subset = as.data.frame(treecov.subset)

#plot the data for cover

hist(treecov[ , 'Abies fraseri'], 
     xlab = "Tree Cover for Abies fraseri",
     ylab = "Frequency",
     main = "Histogram of Tree Cover for Abies Fraseri")

hist(treecov[ , 'Acer rubrum'],
     xlab = "Tree Cover for Acer Rubrum",
     ylab = "Frequency", 
     main = "Histogram of Tree Cover for Acer Rubrum")


#use aggregate for mutiple columns with the environmental variables

env <- aggregate(trees[ , c('elev', 'tci' , 'beers' , 'streamdist')]
                 , by = list(trees$plotID), mean)

#null model
null_mod = lm(cover ~ 1, data = trees)
null_mod

#model
my.mod = lm(formula = cover ~ streamdist + elev + tci
            + disturb, data = trees,
            subset = species == "Acer rubrum")

my.mod.abies = lm(formula = cover ~ streamdist + elev + tci
                 + disturb, data = trees,
                 subset = species == "Abies fraseri")



##The exploratory model makes it clear to visualize that the 
## Acer Rubrum species seems to have a much larger range of 
## cover than the Abies fraseri that seemed to exist at a niche range

## Stream distance, tci and disturbance are the most important 
# explanatory variables

## Variance is more easily explained in the Acer rubrum species 
## because it is less specialized



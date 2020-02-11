library(vegan)
data(dune)
data(dune.env)
?dune

dune_mds = metaMDS(dune)


plot(dune_mds, type='n')
text(dune_mds, 'sp', cex=.5)
# generate vector of colors 
color_vect = rev(terrain.colors(6))[-1]
points(dune_mds, 'sites', pch=19, 
       col=color_vect[dune.env$Moisture])
legend('topright', paste("Moisture =", 1:5, sep=''), 
       col=color_vect, pch=19)

#Moisture Color Key: Green = 5, Light Green = 4, Yellow = 3,
# Orange-Brown = 2, Pink-Brown = 1

##Describe how you interpret the graphic. 
#The graphic plots the moisture levels by using different colored
#points. The points are grouped by moisture level, with the 
#higher level moisture points to the right of 0 and the lower
#moisture levels to the left of zero.

##What is the goal of creating such a plot? 
#The goal of creating this plot is to be able to visuilize the
#data and allow us to look for a pattern in the data.


##Does this analysis suggest any interesting findings with 
#respect to the dune vegetation?

cca_dune = cca(dune ~ ., data=dune.env)

plot(cca_dune)

cca_moist = cca(dune.env$Moisture ~ ., data = dune)

duneR2 = RsquareAdj(cca_dune, 999)

anova(cca_dune, permutations = 999)



anova(cca_dune, by='margin', permutations = 999)

#I found the data to more useful from the second test but the plot
#more difficult to interpret.

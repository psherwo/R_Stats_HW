"./data/tgpp.csv"
tgpp = read.csv("./data/tgpp.csv")
 
#(1) names of columns:
    #plot      year record_id    corner     scale  richness   easting  northing     slope        ph    yrsslb 
   

#(2) 
      dim(tgpp)
      #the data file has 11 columns and 4,080 rows
   

# (3) What kind of object is each data column?
sapply(tgpp, class)
  ## plot      year record_id    corner     scale  richness   easting  northing     slope        ph    yrsslb 
  ##"integer" "integer" "integer" "integer" "numeric" "integer" "integer" "integer" "integer" "numeric" "numeric" 

  
# (4)
tgpp[c(1, 5, 8), c(3, 7, 10)]
    #record_id easting  ph
    #1       187  727000 6.9
    #5       191  727000 6.9
    #8       194  727000 6.9

# (5) use plot then play around with it to get it to look right then use the pdf function to save it



plot(tgpp)
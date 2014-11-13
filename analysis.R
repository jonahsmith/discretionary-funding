setwd("~/Dropbox/school/politics/story/discretionary/data/")

y15<- read.csv("funded_disclosure_FY2015.csv", fileEncoding= "latin1")

# Cleanup Councilmember names
## trailing whitespace
y15$Council.Member <- gsub("\\s+$", "", y15$Council.Member)

## fix Treyger (what is that symbol?)
y15$Council.Member <- gsub("TreygerÊ", "Treyger", y15$Council.Member)

## cleanup
y15$Council.Member <- as.factor(y15$Council.Member)

# Cleanup Legal.Name.of.Organization
length(levels(y15$Legal.Name.of.Organization)) #start with __

y15$Legal.Name.of.Organization <- gsub("^\\s+|\\s+$", "", y15$Legal.Name.of.Organization)
length(levels(y15$Legal.Name.of.Organization)) #reduce to __

y15$Legal.Name.of.Organization <- gsub("^\\s+|\\s+$", "", y15$Legal.Name.of.Organization) #Inc. <- Inc
length(levels(y15$Legal.Name.of.Organization)) #reduce to __

#  ", Inc" <- [A-Za-z] \\s Inc (except not quite because this would replace the last character)
length(levels(y15$Legal.Name.of.Organization)) #reduce to __

# Uppercase everything
length(levels(y15$Legal.Name.of.Organization)) #reduce to __
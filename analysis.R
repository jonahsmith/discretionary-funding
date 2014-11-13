setwd("~/Dropbox/school/politics/story/discretionary/data/")

y15<- read.csv("funded_disclosure_FY2015.csv", fileEncoding= "latin1")

# Cleanup Councilmember names
## trailing whitespace
y15$Council.Member <- gsub("\\s+$", "", y15$Council.Member)

## fix Treyger (what is that symbol?)
y15$Council.Member <- gsub("TreygerÊ", "Treyger", y15$Council.Member)

## cleanup
y15$Council.Member <- as.factor(y15$Council.Member)

# 
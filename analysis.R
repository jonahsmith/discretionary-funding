setwd("~/Dropbox/school/politics/story/discretionary/data/")

y14 <- read.csv("funded_disclosure_FY2014.csv", fileEncoding= "latin1")
y15 <- read.csv("funded_disclosure_FY2015.csv", fileEncoding= "latin1")

y14$Year <- 2014
y15$Year <- 2015

y14$Status <- NA
y15$X. <- NA

funding <- rbind(y14,y15)

# Clean up Councilmember names
## trailing whitespace
funding$Council.Member <- gsub("^\\s+|\\s+$", "", funding$Council.Member)

## uppercase
funding$Council.Member <- toupper(funding$Council.Member)

## fix Treyger and Gonzalez (non-unicode characters)
funding$Council.Member <- gsub("TREYGERÊ", "TREYGER", funding$Council.Member)
funding$Council.Member <- gsub("\u0087", "A", funding$Council.Member)

## cleanup
funding$Council.Member <- as.factor(funding$Council.Member)

# Cleanup Legal.Name.of.Organization
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3854

## leading and trailing spaces
funding$Legal.Name.of.Organization <- gsub("^\\s+|\\s+$", "", funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3730

## upper case
funding$Legal.Name.of.Organization <- toupper(funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3702

## remove commas, periods, and apostrophes
funding$Legal.Name.of.Organization <- gsub("[.,']", "", funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3604

## remove inc, corp (as its own word to avoid corps), and corporation
funding$Legal.Name.of.Organization <- gsub("\\s+INC|\\s+CORP|\\s+CORPORATION", "", funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3465

## change "and"
funding$Legal.Name.of.Organization <- gsub("&", "AND", funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3460

## cleanup
funding$Legal.Name.of.Organization <- as.factor(funding$Legal.Name.of.Organization)
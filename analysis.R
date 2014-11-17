# My machine settings
setwd("~/Dropbox/school/politics/story/data/")

############################## IMPORT ################################
# Import budget data
y14 <- read.csv("funded_disclosure_FY2014.csv", fileEncoding= "latin1")
y15 <- read.csv("funded_disclosure_FY2015.csv", fileEncoding= "latin1")

y14$Year <- 2014
y15$Year <- 2015

y14$Status <- NA
y15$X. <- NA

funding <- rbind(y14,y15)

# Import council member data
cm14 <- read.csv("councilmembers-2014.csv")
cm15 <- read.csv("councilmembers-2015.csv")

cm14$Year <- 2014
cm15$Year <- 2015

members <- rbind(cm14,cm15)

# Housekeeping
rm(y14,y15, cm14, cm15)

############################## CLEANING + SMASHING ################################
# Clean up Councilmember names
## trailing whitespace
funding$Council.Member <- gsub("^\\s+|\\s+$", "", funding$Council.Member)

## uppercase
funding$Council.Member <- toupper(funding$Council.Member)

## fix Treyger and Gonzalez (non-unicode characters), and switch "Viverito" to "Mark-Viverito"
funding$Council.Member <- gsub("TREYGERÊ", "TREYGER", funding$Council.Member)
funding$Council.Member <- gsub("\u0087", "A", funding$Council.Member)
funding$Council.Member <- gsub("^VIVERITO", "MARK-VIVERITO", funding$Council.Member)

## cleanup
funding$Council.Member <- as.factor(funding$Council.Member)

# Smash district info + funding
## first, parse names to get last names
names <- toupper(members$NAME)
names <- gsub("[.|,]", "", names)
names <- gsub(" JR", "", names)
names <- sapply(names, function(x) strsplit(x, " ")[[1]][length(strsplit(x," ")[[1]])])
members$Council.Member <- names
members$Council.Member[members$Council.Member == "BRAMER"] <- "VAN BRAMER" #one manual fix

## smash
funding <- merge(funding, members, all.x = TRUE, by=c("Year", "Council.Member"))

## housekeeping
rm(names, members)

# Cleanup "Amount..."
funding$Amount... <- gsub("[$|,]", "", funding$Amount...)
funding$Amount... <- as.numeric(funding$Amount...)


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

# Cleanup addresses
length(levels(as.factor(funding$Address)))	#3820

## leading and trailing spaces
funding$Address <- gsub("^\\s+|\\s+$", "", funding$Address)
length(levels(as.factor(funding$Address)))	#3798

## all caps
funding$Address <- toupper(funding$Address)
length(levels(as.factor(funding$Address)))	#3690

## avenue, street, etc
funding$Address <- gsub("\\s+AVE.?\\s+", " AVENUE ", funding$Address)
funding$Address <- gsub("\\s+AVE.?$", " AVENUE", funding$Address)
length(levels(as.factor(funding$Address)))	#3608

funding$Address <- gsub("\\s+ST.?\\s+", " STREET ", funding$Address)
funding$Address <- gsub("\\s+ST.?$", " STREET", funding$Address)
length(levels(as.factor(funding$Address)))	#3555

funding$Address <- gsub("\\s+RD.?\\s+", " ROAD ", funding$Address)
funding$Address <- gsub("\\s+RD.?$", " ROAD", funding$Address)
length(levels(as.factor(funding$Address)))	#3552

## Deal with post office boxes
funding$Address <- gsub("POST OFFICE BOX", "PO BOX", funding$Address)
funding$Address <- gsub("P[.|\\s+]O.?", "PO", funding$Address)
funding$Address <- gsub("POBOX", "PO BOX", funding$Address)

length(levels(as.factor(funding$Address)))	#3554

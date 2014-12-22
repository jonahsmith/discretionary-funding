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

# Import zip code buroughs
zips <- read.csv("zip-codes.csv")
zipa <- read.csv("zip-codes-alt.csv", header=FALSE, col.names = c("Spending.zip", "Spending.borough.alt")) #alternative, less reputable but more complete
zipa$Spending.zip <- as.factor(zipa$Spending.zip)

# Housekeeping
rm(y14,y15, cm14, cm15)

# Clean up Councilmember names
## trailing whitespace
funding$Council.Member <- gsub("^\\s+|\\s+$", "", funding$Council.Member)

## remove 'Delegation' <- same between 2014 and 2015
funding$Council.Member <- gsub(" Delegation", "", funding$Council.Member)
funding$Council.Member <- gsub("CD 28", "CD28", funding$Council.Member)
funding$Council.Member <- gsub("^SI$", "STATEN ISLAND", funding$Council.Member)

## uppercase
funding$Council.Member <- toupper(funding$Council.Member)

## fix Treyger and Gonzalez (non-unicode characters), and switch "Viverito" to "Mark-Viverito"
funding$Council.Member <- gsub("TREYGERÊ", "TREYGER", funding$Council.Member)
funding$Council.Member <- gsub("\u0087", "A", funding$Council.Member)
funding$Council.Member <- gsub("^VIVERITO", "MARK-VIVERITO", funding$Council.Member)

## housekeeping
funding$Council.Member[funding$Council.Member == ""] <- NA
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

## artificially add some district info -- this is slightly broken, need 
funding$BOROUGH[funding$Council.Member == "CD28"] <- "QUEENS"
funding$BOROUGH[funding$Council.Member == "CD19"] <- "QUEENS"

## housekeeping
rm(names, members)

# Clean up zipcodes

## make an actual list of zip-codes from raw data (reputable)
zips$ZIP.Codes <- as.character(zips$ZIP.Codes)
zip <- strsplit(zips$ZIP.Codes, ",")

zipc = data.frame()	#this is about as inefficiently as I could possibly have done this...
for (i in 1:length(zip)){
	for (j in 1:length(zip[[i]])){
		zipc <- rbind(zipc, data.frame(Spending.borough.rep = zips$Borough[i], Spending.zip = zip[[i]][j]))
	}
}
zipc$Spending.zip <- gsub(" ", "", zipc$Spending.zip)
rm(zip, i, j)

## regularize the 'funding' column by reducing to 5 digit zip
funding$Spending.zip <- funding$Zip.Code
funding$Spending.zip <- as.character(funding$Spending.zip)
funding$Spending.zip <- sapply(funding$Spending.zip, function(x) strsplit(x, "-")[[1]][1])
funding$Spending.zip <- gsub("\n","", funding$Spending.zip)
funding$Spending.zip <- gsub("ZipCode2: [0-9]*","", funding$Spending.zip)
funding$Spending.zip <- gsub("[#]?N/A","", funding$Spending.zip)
funding$Spending.zip <- gsub(" ","", funding$Spending.zip)
funding$Spending.zip[funding$Spending.zip == ""] <- NA
funding$Spending.zip <- as.factor(funding$Spending.zip)

## smash
funding <- merge(funding, zipc, all.x = TRUE, by="Spending.zip")
funding <- merge(funding, zipa, all.x = TRUE, by="Spending.zip")

# Cleanup "Amount..."
funding$Amount... <- gsub("[$|,]", "", funding$Amount...)
funding$Amount... <- as.numeric(funding$Amount...)

# Cleanup "Source"
funding$Source <- as.character(funding$Source)
funding$Source <- gsub("^\\s+|\\s+$", "", funding$Source)
funding$Source <- toupper(funding$Source)
funding$Source <- as.factor(funding$Source)

# Cleanup Legal.Name.of.Organization
length(levels(as.factor(funding$Legal.Name.of.Organization))) #3854

## leading and trailing spaces
funding$Cleaned.Organization <- gsub("^\\s+|\\s+$", "", funding$Legal.Name.of.Organization)
length(levels(as.factor(funding$Cleaned.Organization))) #3730

## upper case
funding$Cleaned.Organization <- toupper(funding$Cleaned.Organization)
length(levels(as.factor(funding$Cleaned.Organization))) #3702

## remove commas, periods, and apostrophes
funding$Cleaned.Organization <- gsub("[.,']", "", funding$Cleaned.Organization)
length(levels(as.factor(funding$Cleaned.Organization))) #3604

## remove inc, corp (as its own word to avoid corps), and corporation
funding$Cleaned.Organization <- gsub("\\s+INC|\\s+CORP|\\s+CORPORATION", "", funding$Cleaned.Organization)
length(levels(as.factor(funding$Cleaned.Organization))) #3465

## change "and"
funding$Cleaned.Organization <- gsub("&", "AND", funding$Cleaned.Organization)
length(levels(as.factor(funding$Cleaned.Organization))) #3460

## cleanup
funding$Cleaned.Organization <- as.factor(funding$Cleaned.Organization)

# A bit of renaming
funding$Amount <- funding$Amount...
funding$Amount... <- NULL

funding$Address2 <- funding$Address.2..optional
funding$Address.2..optional <- NULL

funding$CM.District <- funding$DISTRICT
funding$DISTRICT <- NULL

funding$CM.Borough <- funding$BOROUGH 
funding$BOROUGH <- NULL

funding$CM.Party <- funding$POLITICAL.PARTY
funding$POLITICAL.PARTY <- NULL

funding$CM.fullname <- funding$NAME
funding$NAME <- NULL

# Save the file
write.csv(funding, file="../funding.csv")
save(funding, file = "../funding.Rdata")
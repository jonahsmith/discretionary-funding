# Funding per category
load("../funding.Rdata")

#############################################################
# Question: how much total spending each year?
sum(subset(funding, Year == 2014, select=Amount)) #393736975
sum(subset(funding, Year == 2015, select=Amount)) #290430654

#############################################################
# Question: Difference in number of initiatives?
sum(table(subset(funding, Year == 2014, select=Source)) != 0)
sum(table(subset(funding, Year == 2015, select=Source)) != 0)

#############################################################
# Delegation spending

## totals
sum(subset(funding, Year == 2014 & Council.Member %in% c("BRONX", "BROOKLYN", "MANHATTAN", "STATEN ISLAND", "QUEENS"), select=Amount))
sum(subset(funding, Year == 2015 & Council.Member %in% c("BRONX", "BROOKLYN", "MANHATTAN", "STATEN ISLAND", "QUEENS"), select=Amount))

## by borough
sum(subset(funding, Year == 2014 & Council.Member=="BRONX", select=Amount))
sum(subset(funding, Year == 2015 & Council.Member=="BRONX", select=Amount))

sum(subset(funding, Year == 2014 & Council.Member=="BROOKLYN", select=Amount))
sum(subset(funding, Year == 2015 & Council.Member=="BROOKLYN", select=Amount))

sum(subset(funding, Year == 2014 & Council.Member=="MANHATTAN", select=Amount))
sum(subset(funding, Year == 2015 & Council.Member=="MANHATTAN", select=Amount))

sum(subset(funding, Year == 2014 & Council.Member=="STATEN ISLAND", select=Amount))
sum(subset(funding, Year == 2015 & Council.Member=="STATEN ISLAND", select=Amount))

sum(subset(funding, Year == 2014 & Council.Member=="QUEENS", select=Amount))
sum(subset(funding, Year == 2015 & Council.Member=="QUEENS", select=Amount))


#############################################################
# Question: how much total funding for different major initiatives?

sum(subset(funding, Year == 2014 & Source == "LOCAL", select=Amount)) #37372282
sum(subset(funding, Year == 2015 & Source == "LOCAL", select=Amount)) #36648500

sum(subset(funding, Year == 2014 & Source == "POVERTY", select=Amount)) #0
sum(subset(funding, Year == 2015 & Source == "POVERTY", select=Amount)) #2800000

sum(subset(funding, Year == 2014 & Source == "DOMESTIC VIOLENCE AND EMPOWERMENT (DOVE) INITIATIVE", select=Amount)) #2825000
sum(subset(funding, Year == 2015 & Source == "DOMESTIC VIOLENCE AND EMPOWERMENT (DOVE) INITIATIVE", select=Amount)) #7891667

sum(subset(funding, Year == 2014 & Source == "AGING", select=Amount)) #5551250
sum(subset(funding, Year == 2015 & Source == "AGING", select=Amount)) #5612000

sum(subset(funding, Year == 2014 & Source == "YOUTH", select=Amount)) #7738914
sum(subset(funding, Year == 2015 & Source == "YOUTH", select=Amount)) #7645500

#############################################################
# Question: Where is the money being spent?

sum(subset(funding, Year == 2014 & CM.Borough == "Manhattan", select=Amount))
sum(subset(funding, Year == 2015 & CM.Borough == "Manhattan", select=Amount))

sum(subset(funding, Year == 2014 & CM.Borough == "Brooklyn", select=Amount))
sum(subset(funding, Year == 2015 & CM.Borough == "Brooklyn", select=Amount))

sum(subset(funding, Year == 2014 & CM.Borough == "Queens", select=Amount))
sum(subset(funding, Year == 2015 & CM.Borough == "Queens", select=Amount))

sum(subset(funding, Year == 2014 & CM.Borough == "Bronx", select=Amount))
sum(subset(funding, Year == 2015 & CM.Borough == "Bronx", select=Amount))

sum(subset(funding, Year == 2014 & CM.Borough == "Staten Island", select=Amount))
sum(subset(funding, Year == 2015 & CM.Borough == "Staten Island", select=Amount))

sum(subset(funding, Year == 2015 & CM.Borough == "Manhattan and Bronx", select=Amount)) #what should we do about this?

#############################################################
# Question: Where is the money spent?

## Manhattan
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Manhattan", select=Amount))
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Manhattan", select=Amount))/sum(subset(funding, Year == 2014, select=Amount)) #<- 19% of funding in 2014

sum(subset(funding, Year == 2015 & Spending.borough.alt == "Manhattan", select=Amount))
sum(subset(funding, Year == 2015 & Spending.borough.alt == "Manhattan", select=Amount))/sum(subset(funding, Year == 2015, select=Amount)) #<- 9% of funding in 2015

## Brooklyn
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Brooklyn", select=Amount))
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Brooklyn", select=Amount))/sum(subset(funding, Year == 2014, select=Amount)) #<- 9.9% of funding in 2014

sum(subset(funding, Year == 2015 & Spending.borough.alt == "Brooklyn", select=Amount))
sum(subset(funding, Year == 2015 & Spending.borough.alt == "Brooklyn", select=Amount))/sum(subset(funding, Year == 2015, select=Amount)) #<- 5.6% of funding in 2015

## Queens
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Queens", select=Amount))
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Queens", select=Amount))/sum(subset(funding, Year == 2014, select=Amount)) #<- 5.3% of funding in 2014

sum(subset(funding, Year == 2015 & Spending.borough.alt == "Queens", select=Amount))
sum(subset(funding, Year == 2015 & Spending.borough.alt == "Queens", select=Amount))/sum(subset(funding, Year == 2015, select=Amount)) #<- 3.2% of funding in 2015

## Bronx
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Bronx", select=Amount))
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Bronx", select=Amount))/sum(subset(funding, Year == 2014, select=Amount)) #<- 5.6% of funding in 2014

sum(subset(funding, Year == 2015 & Spending.borough.alt == "Bronx", select=Amount))
sum(subset(funding, Year == 2015 & Spending.borough.alt == "Bronx", select=Amount))/sum(subset(funding, Year == 2015, select=Amount)) #<- 1.99% of funding in 2015

## Staten Island
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Staten", select=Amount))
sum(subset(funding, Year == 2014 & Spending.borough.alt == "Staten", select=Amount))/sum(subset(funding, Year == 2014, select=Amount)) #<- 1.94% of funding in 2014

sum(subset(funding, Year == 2015 & Spending.borough.alt == "Staten", select=Amount))
sum(subset(funding, Year == 2015 & Spending.borough.alt == "Staten", select=Amount))/sum(subset(funding, Year == 2015, select=Amount)) #<- .88% of funding in 2015

## Takeaway: spending in each borough as a percentage of total spending fell in every borough, suggesting more spending outside of the city.

#############################################################
# Question: How much of the money is spent in-borough?

## Manhattan
sum(subset(funding, Year == 2014 & CM.Borough == "Manhattan" & Spending.borough.alt != "Manhattan", select=Amount))/sum(subset(funding, CM.Borough == "Manhattan" & Year == 2014, select=Amount)) #<- 2.1% of Manhattan funding in 2014

sum(subset(funding, Year == 2015 & CM.Borough == "Manhattan" & Spending.borough.alt != "Manhattan", select=Amount))/sum(subset(funding, CM.Borough == "Manhattan" & Year == 2015, select=Amount)) #<- 5.53% of funding in 2015

## Brooklyn
sum(subset(funding, Year == 2014 & CM.Borough == "Brooklyn" & Spending.borough.alt != "Brooklyn", select=Amount))/sum(subset(funding, CM.Borough == "Brooklyn" & Year == 2014, select=Amount)) #<- 7.3% of borough funding in 2014

sum(subset(funding, Year == 2015 & CM.Borough == "Brooklyn" & Spending.borough.alt != "Brooklyn", select=Amount))/sum(subset(funding, CM.Borough == "Brooklyn" & Year == 2015, select=Amount)) #<- 19.9% of borough funding in 2015

## Queens
sum(subset(funding, Year == 2014 & CM.Borough == "Queens" & Spending.borough.alt != "Queens", select=Amount))/sum(subset(funding, CM.Borough == "Queens" & Year == 2014, select=Amount)) #<- 13.2% of borough funding in 2014

sum(subset(funding, Year == 2015 & CM.Borough == "Queens" & Spending.borough.alt != "Queens", select=Amount))/sum(subset(funding, CM.Borough == "Queens" & Year == 2015, select=Amount)) #<- 28.1% of borough funding in 2015

## Bronx
sum(subset(funding, Year == 2014 & CM.Borough == "Bronx" & Spending.borough.alt != "Bronx", select=Amount))/sum(subset(funding, CM.Borough == "Bronx" & Year == 2014, select=Amount)) #<- 14.88% of borough funding in 2014

sum(subset(funding, Year == 2015 & CM.Borough == "Bronx" & Spending.borough.alt != "Bronx", select=Amount))/sum(subset(funding, CM.Borough == "Bronx" & Year == 2015, select=Amount)) #<- 30.9% of borough funding in 2015

## Staten Island
sum(subset(funding, Year == 2014 & CM.Borough == "Staten Island" & Spending.borough.alt != "Staten Island", select=Amount))/sum(subset(funding, CM.Borough == "Staten Island" & Year == 2014, select=Amount)) #<- 74.7% of borough funding in 2014

sum(subset(funding, Year == 2015 & CM.Borough == "Staten Island" & Spending.borough.alt != "Staten Island", select=Amount))/sum(subset(funding, CM.Borough == "Staten Island" & Year == 2015, select=Amount)) #<- 78.2% of borough funding in 2015

## Takeaway: spending within borough has gone down, despite the election year last year.
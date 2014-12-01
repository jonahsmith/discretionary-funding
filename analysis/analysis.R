# Funding per category
load("../funding.Rdata")

#############################################################
# Question: how much total spending each year?
sum(subset(funding, Year == 2014, select=Amount...)) #393736975
sum(subset(funding, Year == 2015, select=Amount...)) #290430654

#############################################################
# Question: how much total funding for different major initiatives?

sum(subset(funding, Year == 2014 & Source == "LOCAL", select=Amount...)) #37372282
sum(subset(funding, Year == 2015 & Source == "LOCAL", select=Amount...)) #36648500

sum(subset(funding, Year == 2014 & Source == "POVERTY", select=Amount...)) #0
sum(subset(funding, Year == 2015 & Source == "POVERTY", select=Amount...)) #2800000

sum(subset(funding, Year == 2014 & Source == "DOMESTIC VIOLENCE AND EMPOWERMENT (DOVE) INITIATIVE", select=Amount...)) #2825000
sum(subset(funding, Year == 2015 & Source == "DOMESTIC VIOLENCE AND EMPOWERMENT (DOVE) INITIATIVE", select=Amount...)) #7891667

sum(subset(funding, Year == 2014 & Source == "AGING", select=Amount...)) #5551250
sum(subset(funding, Year == 2015 & Source == "AGING", select=Amount...)) #5612000

sum(subset(funding, Year == 2014 & Source == "YOUTH", select=Amount...)) #7738914
sum(subset(funding, Year == 2015 & Source == "YOUTH", select=Amount...)) #7645500

#############################################################
# Question: Where is the money being spent?

sum(subset(funding, Year == 2014 & BOROUGH == "Manhattan", select=Amount...))
sum(subset(funding, Year == 2015 & BOROUGH == "Manhattan", select=Amount...))

sum(subset(funding, Year == 2014 & BOROUGH == "Brooklyn", select=Amount...))
sum(subset(funding, Year == 2015 & BOROUGH == "Brooklyn", select=Amount...))

sum(subset(funding, Year == 2014 & BOROUGH == "Queens", select=Amount...))
sum(subset(funding, Year == 2015 & BOROUGH == "Queens", select=Amount...))

sum(subset(funding, Year == 2014 & BOROUGH == "Bronx", select=Amount...))
sum(subset(funding, Year == 2015 & BOROUGH == "Bronx", select=Amount...))

sum(subset(funding, Year == 2014 & BOROUGH == "Staten Island", select=Amount...))
sum(subset(funding, Year == 2015 & BOROUGH == "Staten Island", select=Amount...))

sum(subset(funding, Year == 2015 & BOROUGH == "Manhattan and Bronx", select=Amount...)) #what should we do about this?

#############################################################
# Question: Where is the money spent?

## Manhattan
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Manhattan", select=Amount...))
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Manhattan", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2014, select=Amount...)) #<- 45% of funding in 2014

sum(subset(funding, Year == 2015 & Spending_borough_alt == "Manhattan", select=Amount...))
sum(subset(funding, Year == 2015 & Spending_borough_alt == "Manhattan", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2015, select=Amount...)) #<- 43.2% of funding in 2015

## Brooklyn
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Brooklyn", select=Amount...))
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Brooklyn", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2014, select=Amount...)) #<- 23.8% of funding in 2014

sum(subset(funding, Year == 2015 & Spending_borough_alt == "Brooklyn", select=Amount...))
sum(subset(funding, Year == 2015 & Spending_borough_alt == "Brooklyn", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2015, select=Amount...)) #<- 27.3% of funding in 2015

## Queens
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Queens", select=Amount...))
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Queens", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2014, select=Amount...)) #<- 12.7% of funding in 2014

sum(subset(funding, Year == 2015 & Spending_borough_alt == "Queens", select=Amount...))
sum(subset(funding, Year == 2015 & Spending_borough_alt == "Queens", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2015, select=Amount...)) #<- 15.5% of funding in 2015

## Bronx
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Bronx", select=Amount...))
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Bronx", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2014, select=Amount...)) #<- 13.4% of funding in 2014

sum(subset(funding, Year == 2015 & Spending_borough_alt == "Bronx", select=Amount...))
sum(subset(funding, Year == 2015 & Spending_borough_alt == "Bronx", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2015, select=Amount...)) #<- 9.6% of funding in 2015

## Staten Island
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Staten", select=Amount...))
sum(subset(funding, Year == 2014 & Spending_borough_alt == "Staten", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2014, select=Amount...)) #<- 4.6% of funding in 2014

sum(subset(funding, Year == 2015 & Spending_borough_alt == "Staten", select=Amount...))
sum(subset(funding, Year == 2015 & Spending_borough_alt == "Staten", select=Amount...))/sum(subset(funding, !is.na(Spending_borough_alt) & Year == 2015, select=Amount...)) #<- 4.3% of funding in 2015

## Takeaway: it rose in Brooklyn and Queens, stayed the same in Staten Island, but fell in the Bronx

#############################################################
# How has the amount of unaffiliated money changed?

sum(subset(funding, Year == 2014 & is.na(NAME), select=Amount...))/sum(subset(funding, Year == 2014, select=Amount...)) #0.781993

sum(subset(funding, Year == 2015 & is.na(NAME), select=Amount...))/sum(subset(funding, Year == 2015, select=Amount...)) #0.8197954

## break it down by borough (by spending, I guess)
sum(subset(funding, Year == 2014 & is.na(NAME) & Spending_borough_alt == "Manhattan", select=Amount...))/sum(subset(funding, Year == 2014 & Spending_borough_alt == "Manhattan", select=Amount...)) #0.8336326

sum(subset(funding, Year == 2015 & is.na(NAME) & Spending_borough_alt == "Manhattan", select=Amount...))/sum(subset(funding, Year == 2015 & Spending_borough_alt == "Manhattan", select=Amount...)) #0.4096371

sum(subset(funding, Year == 2014 & is.na(NAME) & Spending_borough_alt == "Brooklyn", select=Amount...))/sum(subset(funding, Year == 2014 & Spending_borough_alt == "Brooklyn", select=Amount...)) #0.7216939

sum(subset(funding, Year == 2015 & is.na(NAME) & Spending_borough_alt == "Brooklyn", select=Amount...))/sum(subset(funding, Year == 2015 & Spending_borough_alt == "Brooklyn", select=Amount...)) #0.7216939

sum(subset(funding, Year == 2014 & is.na(NAME) & Spending_borough_alt == "Queens", select=Amount...))/sum(subset(funding, Year == 2014 & Spending_borough_alt == "Queens", select=Amount...)) #0.6662386

sum(subset(funding, Year == 2015 & is.na(NAME) & Spending_borough_alt == "Queens", select=Amount...))/sum(subset(funding, Year == 2015 & Spending_borough_alt == "Queens", select=Amount...)) #0.6662386

sum(subset(funding, Year == 2014 & is.na(NAME) & Spending_borough_alt == "Bronx", select=Amount...))/sum(subset(funding, Year == 2014 & Spending_borough_alt == "Bronx", select=Amount...)) #0.8134873

sum(subset(funding, Year == 2015 & is.na(NAME) & Spending_borough_alt == "Bronx", select=Amount...))/sum(subset(funding, Year == 2015 & Spending_borough_alt == "Bronx", select=Amount...)) #0.8134873

sum(subset(funding, Year == 2014 & is.na(NAME) & Spending_borough_alt == "Staten", select=Amount...))/sum(subset(funding, Year == 2014 & Spending_borough_alt == "Staten", select=Amount...)) #0.6674196

sum(subset(funding, Year == 2015 & is.na(NAME) & Spending_borough_alt == "Staten", select=Amount...))/sum(subset(funding, Year == 2015 & Spending_borough_alt == "Staten", select=Amount...)) #0.1676165

#############################################################
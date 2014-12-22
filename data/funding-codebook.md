---
title: NYC Discretionary Funding codebook
author: Jonah Smith
date: 12/22/2014
---

| *Variable* | *Source* | *Definition* |
| ---------- | -------- | ------------- |
| ```Spending.zip``` | Cleaned from column ```Zip.code``` | Zip code of organization where discretionary funding was spent. |
| ```Year``` | Created when merging FY2014 and FY2015 data | The fiscal year of the expenditure. Note the fiscal year extends from July 1 to June 30. |
| ```Council.Member``` | Official discretionary funding data  (Council website) | Name of the council member who decided on the use of funds. |
| ```Source``` |  Official discretionary funding data  (Council website) | Expenditure category (the spending programs). |
| ```Legal.Name.of.Organization``` | Official discretionary funding data  (Council website) | Name of organization receiving the funding, as it appears on official dataset |
| ```EIN``` | Official discretionary funding data  (Council website) | Not sure what this variable represents, but appears to be a nonprofit ID number. |
| ```X.``` | Official discretionary funding data  (Council website) | Not sure what this variable represents, but seems to be the same as ```Status``` |
| ```Agency``` | Official discretionary funding data  (Council website) | The agency administering the funds. |
| ```Program.Name``` | Official discretionary funding data  (Council website) | Not entirely sure, but appears to be the name of the program being funded, if one in particular is being targeted. |
| ```Address``` | Official discretionary funding data  (Council website) | First address line of organization receiving funding |
| ```City``` | Official discretionary funding data  (Council website) | City of organization receiving funding. |
| ```State``` | Official discretionary funding data  (Council website) | State of the organization receiving funding. |
| ```Zip.Code``` | Official discretionary funding data  (Council website) | Zip code of the organizations receiving funding. |
| ```Purpose.of.Funds``` | Official discretionary funding data  (Council website) | Description provided by organizations of what the funding will be used for. |
| ```Fiscal.Conduit.Name``` | Official discretionary funding data  (Council website) | Name of fiscal conduit. Small nonprofits use larger organizations to administer the funds on their behalf. |
| ```FC.EIN``` | Official discretionary funding data  (Council website) | EIN (see note above) of fiscal conduit (unconfirmed interpretation). |
| ```Status``` | Official discretionary funding data  (Council website) | See ```X.```|
| ```Spending.borough.rep``` | Determined by Spending.zip and the [reputable source](http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm) of zip codes and boroughs | The borough where the organization is located (see Source). |
| ```Spending.borough.alt``` | Determined by Spending.zip and the [more complete source](http://www.nycbynatives.com/nyc_info/new_york_city_zip_codes.php) of zip codes and boroughs | The borough where the organization is located (see Source). |
| ```Cleaned.Organization``` | Cleaned up version of ```Legal.Name.of.Organization``` | Cleaned up version of ```Legal.Name.of.Organization``` |
| ```Amount``` | Official discretionary funding data  (Council website) | Dollar amount of contribution. |
| ```Address2``` |Official discretionary funding data  (Council website) | Second line of address of organization receiving funding. |
| ```CM.District``` | Scraped from council member website and matched to ```Council.Member```. | District of council member who allocated the funds. |
| ```CM.Borough``` | Scraped from council member website and matched to ```Council.Member```. | Borough of the district of the council member who allocated the funds. |
| ```CM.Party``` | Scraped from council member website and matched to ```Council.Member```. | Political party of the council member who allocated the funds. |
| ```CM.fullname``` | Scraped from council member website and matched to ```Council.Member```. | The full name of the council member who allocated the funds. |
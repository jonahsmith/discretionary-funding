This is an analysis of the FY2015 NYC Council discretionary funding expenditures, the first after reform on the distribution of the funding. I am looking to see how the spending has actually changed since the changes. This project is ongoing, but feel free to use the data or code as you wish.

# Directories and Files

## analysis
```analysis.R``` - My analyses of the discretionary funding data. I've included code for some exploratory analyses and the figures used in my story.

## cleanup+smashing
```cleanup.R``` - The master script I used to clean up the variables and combine with supplemental data data.

```councilmembers-2014/5.csv``` - Tables scraped from the council's website (and an archive) of councilmembers, their districts, their boroughs and their political parties.

- 2013: https://web.archive.org/web/20130726124226/http://council.nyc.gov/html/members/members.shtml
- 2014: http://council.nyc.gov/html/members/members.shtml (accessed December 3, 2014)

```data-log.txt``` - overview of the cleanup process. Check hear if you have questions about the data.

```funded_disclosure_FY2014/5.csv``` - CSV versions of the Excel files [made available](http://council.nyc.gov/html/budget/database.shtml) to the public on the City Council website.

```zip-codes-alt.csv``` - NYC zip codes and their corresponding boroughs. Scraped from [a source](http://www.nycbynatives.com/nyc_info/new_york_city_zip_codes.php) with questionable validity, but appears to be accurate and more complete that ```zip-codes.csv```.

```zip-codes.csv``` - An apparently [reputable source](http://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm) of NYC zip codes and boroughs, but less complete than ```zip-codes-alt.csv```.

## data

```funding-codebook.md``` - Reference for the dataset below.

```funding.csv``` - The cleaned and expanded dataset. It includes discretionary funding information for FY2014 and FY2015, along with information on the councilmembers and the borough of the organization where the funding was spent. For a more complete breakdown of the variables, see ```funding-codebook.md```.

```funding.Rdata``` - An Rdata file containing the dataset above.

## documents
```budgettranscript.xml``` - A transcript of the [YouTube video](https://www.youtube.com/watch?v=fqHbiRyUn5I) of the press conference when the final budget was unveiled.
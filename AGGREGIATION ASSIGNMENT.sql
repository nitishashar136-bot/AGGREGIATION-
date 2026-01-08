use world;
SELECT councitytry, COUNT(city_name) AS total_cities
FROM city
GROUP BY country;

### display all continents having more than 30 countries
SELECT Continent, COUNT(*) AS Total_Countries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;

## List regions whose total population exceeds 200 million
SELECT Region, SUM(Population) AS Total_Population
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

## Find the top 5 continents by average GNP per country
SELECT Continent, AVG(GNP) AS Avg_GNP
FROM Country
GROUP BY Continent
ORDER BY Avg_GNP DESC
LIMIT 5;
###Find the total number of official languages spoken in each continent
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS Official_Languages
FROM Country c
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

## Find the maximum and minimum GNP for each continent
SELECT Continent,
       MAX(GNP) AS Max_GNP,
       MIN(GNP) AS Min_GNP
FROM Country
GROUP BY Continent;

## Find the country with the highest average city population
SELECT c.Name AS Country, AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY Avg_City_Population DESC
LIMIT 1;

##List continents where the average city population is greater than 200,000
select continent, Population from country
where population>=(select avg(population) avg_population from country)
order by Population;

## Find the total population and average life expectancy for each continent (ordered by avg life expectancy descending)
SELECT Continent,
       SUM(Population) AS Total_Population,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;

### Top 3 continents with highest average life expectancy (only where total population > 200 million)
SELECT Continent,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy,
       SUM(Population) AS Total_Population
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Avg_Life_Expectancy DESC
LIMIT 3;

###Find the total population and average life expectancy for each continent (ordered by avg life expectancy descending)
SELECT Continent,
       SUM(Population) AS Total_Population,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;
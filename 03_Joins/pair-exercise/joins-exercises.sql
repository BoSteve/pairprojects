-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)

select concat(city.name, ', ', country.name) as city_country, city.population from city 
join country on country.code = city.countrycode
where country.continent = 'Europe' and city.population > 1000000;

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
select cy.name,c.name, cy.population,l.language
from country c, countrylanguage l, city cy
where c.code = l.countrycode AND l.countrycode = cy.countrycode AND l.language = 'French' AND l.isofficial = true AND cy.population > 1000000
ORDER BY l.language;



-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)

select country.name, country.continent,countrylanguage.language from country
join countrylanguage on countrylanguage.countrycode = country.code
where countrylanguage.language = 'Japanese' and countrylanguage.isofficial = true;

-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
select country.name, country.continent from country
join countrylanguage on countrylanguage.countrycode = country.code
where continent = 'Africa' AND countrylanguage.language = 'French' and countrylanguage.isofficial = true;
-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
select avg(city.population) AS "average city population of cities in Europe"  from city
join country on country.code = city.countrycode where country.continent = 'Europe';


-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
select avg(city.population) AS "average city population of cities in Asia" from city
join country on country.code = city.countrycode where country.continent = 'Asia';


-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
select count(*) AS "Cities where English is Offical" from city
join countrylanguage on countrylanguage.countrycode = city.countrycode
where countrylanguage.language = 'English' and countrylanguage.isofficial = true;

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
select AVG(population) AS "Average population of English cities" from city
join countrylanguage on countrylanguage.countrycode = city.countrycode
where countrylanguage.language = 'English' and countrylanguage.isofficial = true;

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
select concat(continent, ' ', Max(city.population)) as largest_city_per_continent from country
join city on city.countrycode = country.code group by continent order by Max(city.population) desc;

-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
select cy.name,c.name, cy.population,l.language
from country c, countrylanguage l, city cy
where c.code = l.countrycode AND l.countrycode = cy.countrycode AND c.continent = 'South America' and cy.population > 1000000
ORDER BY l.language;



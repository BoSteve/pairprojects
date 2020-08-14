-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
--CHECK Query
SELECT *
FROM city
WHERE district = 'Kansas';

INSERT INTO city (name, countrycode, district, population) VALUES ('Smallville', 'USA', 'Kansas', 45001);



-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
--Check query:
SELECT *
FROM countrylanguage
WHERE countrycode = 'USA';

INSERT INTO countrylanguage (countrycode, language, isofficial, percentage) VALUES ('USA', 'Kryptonese', false, 0.0001);



-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
--Check query:

SELECT *
FROM countrylanguage
WHERE countrycode = 'USA';

UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE countrycode = 'USA'
AND language = 'Kryptonese';


-- 4. Set the US captial to Smallville, Kansas in the country table.
--Check query:
SELECT *
FROM country
WHERE code = 'USA';


SELECT *
FROM city
WHERE district = 'Kansas';


UPDATE country
SET capital = 4080
WHERE code = 'USA'
AND capital = 3813;


-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?) 

--It did not succeed because the table city is violating a foriegn key constraint on the table country.

SELECT *
FROM city
WHERE district = 'Kansas'
AND id = 4080;

--DELETE

DELETE
FROM city
WHERE district = 'Kansas'
AND id = 4080;

-- 6. Return the US captial to Washington.

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

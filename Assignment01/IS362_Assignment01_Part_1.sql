-- IS362 Fall 2019 - Assignment 1:  SQL and Tableau Review

-- Part 1. SQL and NULLS

-- 1 How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
SELECT COUNT(speed) FROM planes;

-- 1 What is the minimum listed speed and the maximum listed speed?
SELECT MIN(speed), MAX(speed) FROM planes;

-- 2 What is the total distance flown by all of the planes in January 2013? 
SELECT sum(distance) AS 'Total Distance Flown by All Planes' FROM flights 
WHERE year = '2013' AND month = '1'; 

-- 2 What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT sum(distance) AS 'Total Distance Flown by All Planes missing Tailnum' FROM flights
WHERE year = '2013' AND month = '1' AND tailnum IS NULL;

-- 3 What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
SELECT planes. manufacturer, SUM(flights.distance) 
	FROM flights 
	INNER JOIN planes
	ON planes.tailnum = flights.tailnum
	WHERE flights.year = '2013' AND flights.month ='7' AND flights.day ='5' 
	GROUP BY planes.manufacturer;

-- 3 Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
SELECT planes.manufacturer, SUM(flights.distance)
	FROM flights
    LEFT JOIN planes
    ON planes.tailnum = flights.tailnum
    WHERE flights.year = '2013' AND flights.month = '7' AND flights.day ='5'
    GROUP BY planes.manufacturer;
    
-- 3 How do your results compare?
-- In comparing the 2 results, the inner join filters out the NULL results while the left join came up with the NULL data.

-- 4 Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- 4 Find the plane manufacturer, airline name and the total distance flown on July 1, 2013 order by lowest to highest flight distance.
SELECT planes.manufacturer AS 'Plane Manufacturer', airlines.name AS 'Airline', SUM(flights.distance) AS 'Total Distance'
	FROM flights 
	INNER JOIN planes
	ON planes.tailnum = flights.tailnum
    INNER JOIN airlines
    ON airlines.carrier = flights.carrier
	WHERE flights.year = '2013' AND flights.month ='7' AND flights.day ='1' 
	GROUP BY planes.manufacturer
	ORDER BY SUM(flights.distance);
    
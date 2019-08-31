-- IS362 Fall 2019 - Assignment 1:  SQL and Tableau Review
-- Part 2 Comparing Performance in Tableau
 
SELECT dest, avg(distance)
FROM flights
GROUP BY dest
INTO OUTFILE 's:/362/week01/IS_362_Assignment1.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


    








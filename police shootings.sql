SELECT *
FROM dbo.uspoliceshootings;

--Removing extra data from table
ALTER TABLE dbo.uspoliceshootings
DROP column longitude, latitude, is_geocoding_exact;


--Breakdown of cases by gender, 20 individuals with unknown gender
SELECT gender, COUNT(id)
FROM dbo.uspoliceshootings
GROUP BY gender;

--Breakdown of cases by race
SELECT race, COUNT(id) AS individuals_shot
FROM dbo.uspoliceshootings
GROUP BY race
ORDER BY individuals_shot;


--Finding the total number of fatal shootings by state from 2015-2022
--California had the most, Rhode Island had the fewest
SELECT state, COUNT(id) AS shootings_by_state
FROM dbo.uspoliceshootings
GROUP BY state
ORDER BY shootings_by_state DESC;


--Weapons brandished by individuals
SELECT armed, COUNT(id) AS number_of_weapons
FROM dbo.uspoliceshootings
GROUP BY armed
ORDER BY number_of_weapons DESC;


--How many fatal shootings were against unarmed individuals
SELECT armed, COUNT(id) AS deaths
FROM dbo.uspoliceshootings
WHERE armed = 'unarmed'
GROUP BY armed;


--Fatal police shootings in my home state
SELECT city, COUNT(id) AS deaths
FROM dbo.uspoliceshootings
WHERE state = 'OK'
GROUP BY city
ORDER BY deaths DESC;


--Fatal police shootings in familiar cities
SELECT *
FROM dbo.uspoliceshootings
WHERE state = 'OK'
AND city = 'Norman'
OR city = 'Lawton'
ORDER BY city, date;


--Average age of individuals shot by police
SELECT AVG(age) AS average_age
FROM dbo.uspoliceshootings;





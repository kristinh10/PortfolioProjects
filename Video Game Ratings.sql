Using the dataset Video game ratings from imdb from Kaggle: https://www.kaggle.com/datasets/nyagami/video-game-ratings-from-imdb
Basic querying of video game ratings dataset


CREATE TABLE videogameratingsimdb
(id int, 
title varchar(100),
year int,
genre varchar(100),
rating int,
votes int,
directors varchar(100),
plot varchar(100)
);

TRUNCATE TABLE dbo.videogameratingsimdb;

SELECT * FROM dbo.videogameratingsimdb;

SELECT title
FROM dbo.videogameratingsimdb
WHERE rating > 9;


SELECT title, year
FROM dbo.videogameratingsimdb
WHERE rating > 9
ORDER BY year DESC;


ALTER TABLE dbo.videogameratingsimdb
DROP COLUMN plot;

ALTER TABLE dbo.videogameratingsimdb
DROP COLUMN directors;

SELECT *
FROM dbo.videogameratingsimdb
WHERE votes > 10000 
ORDER BY votes DESC;




SELECT *
FROM dbo.videogameratingsimdb;

SELECT title, year, rating
FROM dbo.videogameratingsimdb
WHERE year IS NOT NULL
ORDER BY year;

SELECT TOP 20 title, rating
FROM dbo.videogameratingsimdb
WHERE genre = 'family'
ORDER BY rating DESC;

SELECT *
FROM dbo.videogameratingsimdb
WHERE year IS NULL;

SELECT COUNT (title) as totalgames
FROM dbo.videogameratingsimdb;

SELECT TOP 20 title, rating, year
FROM dbo.videogameratingsimdb
ORDER BY rating DESC


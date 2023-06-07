--Exploring the Sephora data
select * from sephora_website_dataset

select count (distinct category) as number_of_categories
from sephora_website_dataset


--What brands and categories are the most popular?
--To qualify the average number of reviews for a brand should be >200, rating > 4.5, and love >500

select brand, category, avg(number_of_reviews) AS av_number_reviews, rating, love
from sephora_website_dataset
group by brand, category, rating, love
having avg(number_of_reviews) > 200 AND rating > 4.5 AND love >500
order by love DESC

--The Anastasia Beverly Hills eye palettes are the most popular products
select brand, category, name
from sephora_website_dataset
where brand = 'Anastasia Beverly Hills'
and category = 'Eye Palettes'

--What are some brands and categories that Sephora can consider discontinuing?
--To qualify the average number of reviews shoule be >200, rating <3, and loves <500
select brand, category, name, avg(number_of_reviews) AS av_number_reviews, rating, love
from sephora_website_dataset
group by brand, category,name, rating, love
having avg(number_of_reviews) > 200 AND rating < 3
order by rating

--Why does the Moonchild Glow Kit have a 0 rating but has loves? This might be an error and would need further investigating.
--Sephora's lowest performers are the Agave+Intensive Vegan Lip Mask and the Ink Well Long Wear Matte Eyeliner, these could be discontinued with minimal impact.



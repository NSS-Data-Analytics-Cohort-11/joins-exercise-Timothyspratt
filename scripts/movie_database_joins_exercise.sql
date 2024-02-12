--1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT film_title, release_year, worldwide_gross
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
ORDER BY worldwide_gross ASC;

--Answer: The lowest grossing movie is Semi_tough which released in 1977 with a worldwide_gross of $37,187,139

--2. What year has the highest average imdb rating?

SELECT AVG(imdb_rating) AS imdb_rating, release_year
FROM rating
INNER JOIN specs
ON rating.movie_id = specs.movie_id
GROUP BY release_year
ORDER BY imdb_rating DESC

--Answer: 1991 has the highest average IMDB rating

--3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT mpaa_rating, worldwide_gross, company_name, film_title
FROM specs
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
INNER JOIN distributors
ON specs.domestic_distributor_id = distributors.distributor_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC

--Answer: The highest grossing G-rated movie is Toy Story 4. Walt Disney is the company that distributed it.


--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT DISTINCT(company_name), COUNT(film_title) AS number_of_films
FROM distributors
INNER JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
GROUP BY company_name
ORDER BY number_of_films DESC

--Answer: The number one answer is Walt Disney with 76 movies

--5. Write a query that returns the five distributors with the highest average movie budget.

SELECT company_name, AVG(film_budget) AS film_budget
FROM distributors
INNER JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY company_name
ORDER BY film_budget DESC
LIMIT 5;

--Answer: The 5 distributors with the highest average movie budget are: Walt Disney, Sony Pictures, Lionsgate, Dreamworks, and Warner Bros.


--6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

SELECT
FROM

--7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

SELECT
FROM
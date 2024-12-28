-- Ad hoc analysis
-- Viewing the 'main production companys' with a big budget (100 million dollars)
SELECT main_production_company,
SUM(budget_millions) budget_in_millions
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 100000000
AND production_companies IS NOT NULL
GROUP BY main_production_company
ORDER BY budget_in_millions DESC;


-- Viewing revenue, budget, average runtime and average rating for every production company and applying rank
SELECT 
	main_production_company,
	ROUND(SUM(revenue) / 1000000, 4) AS total_revenue_millions,
    ROUND(SUM(budget) / 1000000, 4) AS total_budget_millions,
    ROUND(AVG(runtime)::numeric, 2) AS average_runtime,
    ROUND(AVG(average_rating)::numeric, 2) AS average_rating,
	RANK() OVER (ORDER BY ROUND(SUM(revenue) / 1000000, 4) DESC) AS total_revenue_rank
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 0
GROUP BY main_production_company
ORDER BY 6;


-- Viewing revenue, budget, average runtime and average rating for every main genre and applying rank
SELECT 
	main_genre,
	ROUND(SUM(revenue) / 1000000, 4) AS total_revenue_millions,
    ROUND(SUM(budget) / 1000000, 4) AS total_budget_millions,
    ROUND(AVG(runtime)::numeric, 2) AS average_runtime,
    ROUND(AVG(average_rating)::numeric, 2) AS average_rating,
	RANK() OVER (ORDER BY ROUND(SUM(revenue) / 1000000, 4) DESC) AS total_revenue_rank
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 0
AND main_genre IS NOT NULL
GROUP BY main_genre
ORDER BY 6;


-- Displaying net revenue over time for every production company and each calender year
SELECT 
	main_production_company,
	title,
	DATE_TRUNC('year', release_date) AS year,
	net_revenue_millions,
	SUM(net_revenue_millions) OVER (PARTITION BY main_production_company ORDER BY DATE_TRUNC('year', release_date)) AS total_revenue_millions
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 0
AND production_companies IS NOT NULL
ORDER BY year;


-- Viewing all titles which got negative revenue
SELECT title,
main_production_company,
release_date,
revenue_millions,
budget_millions,
net_revenue_millions,
budget_to_revenue_ratio
FROM movies_analytics_final
WHERE budget > 1000000
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND net_revenue_millions < 0
ORDER BY net_revenue_millions ASC;


-- Viewing average 'budget to revenue ratio' for all movies
SELECT ROUND(AVG(budget_to_revenue_ratio), 2) AS avg_budget_to_revenue_ratio
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 1000000
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01';


-- Viewing average 'budget to revenue ratio' for all production companies (only incuding big budget productions)
SELECT main_production_company,
	ROUND(AVG(budget_to_revenue_ratio), 2) AS avg_budget_to_revenue_ratio
FROM movies_analytics_final
WHERE revenue > 0
AND budget_millions > 10
AND revenue_millions > 10
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01'
GROUP BY 1
ORDER BY 2 DESC;


-- Looking at a possible correlation between the budget of a movie and its net revenue
SELECT CORR(budget_millions, net_revenue_millions) AS correlation
FROM movies_analytics_final
WHERE net_revenue_millions IS NOT NULL
AND revenue > 0
AND budget_millions > 10
AND revenue_millions > 10
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01';


-- Categorizing the budget of each movie in percentiles
SELECT title,
NTILE(100) OVER (ORDER BY budget_millions) AS budget_percentile
FROM movies_analytics_final
WHERE net_revenue_millions IS NOT NULL
AND revenue > 0
AND budget_millions > 1
AND revenue_millions > 1
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01'
ORDER BY 2 DESC;


-- Looking at the correlation between the percentiles in budget of a movie and its net revenue using a CTE and a CASE expression
WITH budget_percentiles AS (
    SELECT 
        title,
        net_revenue_millions,
        NTILE(100) OVER (ORDER BY budget_millions) AS budget_percentile
    FROM movies_analytics_final
    WHERE net_revenue_millions IS NOT NULL
      AND revenue > 0
      AND budget_millions > 1
	  AND revenue_millions > 1
      AND release_date IS NOT NULL
      AND production_companies IS NOT NULL
      AND genres IS NOT NULL
      AND release_date > '1990-01-01'
)
SELECT 
    CASE 
        WHEN budget_percentile BETWEEN 1 AND 10 THEN '01-10'
        WHEN budget_percentile BETWEEN 11 AND 20 THEN '11-20'
        WHEN budget_percentile BETWEEN 21 AND 30 THEN '21-30'
        WHEN budget_percentile BETWEEN 31 AND 40 THEN '31-40'
        WHEN budget_percentile BETWEEN 41 AND 50 THEN '41-50'
        WHEN budget_percentile BETWEEN 51 AND 60 THEN '51-60'
        WHEN budget_percentile BETWEEN 61 AND 70 THEN '61-70'
        WHEN budget_percentile BETWEEN 71 AND 80 THEN '71-80'
        WHEN budget_percentile BETWEEN 81 AND 90 THEN '81-90'
        WHEN budget_percentile BETWEEN 91 AND 100 THEN '91-100'
    END AS budget_percentile_range,
    CORR(net_revenue_millions, budget_percentile) AS correlation
FROM budget_percentiles
GROUP BY budget_percentile_range
ORDER BY correlation DESC;



-- Looking at a possible correlation between the average rating of a movie and its net revenue
SELECT CORR(net_revenue_millions, average_rating) AS correlation
FROM movies_analytics_final
WHERE net_revenue_millions IS NOT NULL
AND revenue > 0
AND budget_millions > 1
AND revenue_millions > 1
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01';


-- Looking at a possible correlation between the average rating of a movie and its net revenue by genre
SELECT main_genre,
CORR(net_revenue_millions, average_rating) AS correlation
FROM movies_analytics_final
WHERE net_revenue_millions IS NOT NULL
AND revenue > 0
AND budget > 10000000
AND revenue > 10000000
AND release_date IS NOT NULL
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01'
GROUP BY main_genre
ORDER BY 2 DESC;
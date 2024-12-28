-- Looking at the data
SELECT *
FROM movies_analytics_final;


-- Add new columns to create additional information
-- Create columns for 'budget' and 'revenue' to be displayed in million dollars
ALTER TABLE movies_analytics_final
ADD COLUMN revenue_millions numeric,
ADD COLUMN budget_millions numeric;


-- Calculate new values for the columns 'budget' and 'revenue'
UPDATE movies_analytics_final
SET 
    revenue_millions = ROUND(revenue / 1000000, 2),
    budget_millions = ROUND(budget / 1000000, 2);


-- Add new column for 'net revenue'
ALTER TABLE movies_analytics_final
ADD COLUMN net_revenue_millions numeric;


-- Calculate the 'net revenue'
UPDATE movies_analytics_final
SET net_revenue_millions = revenue_millions - budget_millions;


-- Add new column for the 'budget to revenue ratio'
ALTER TABLE movies_analytics_final
ADD COLUMN budget_to_revenue_ratio numeric;


-- Calculate the 'budget to revenue ratio' 
UPDATE movies_analytics_final
SET budget_to_revenue_ratio = ROUND(revenue / budget, 2)
WHERE budget != 0 AND budget IS NOT NULL;


-- By looking at the dataset, it appears the dataset also contains 'video games', 'straight to video prodcutions' and 'TV series'
-- These must be filtered out for our analysis
-- We also only want to analyse modern Blockbusters beginning from 01-01-1990
SELECT *
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 1000000
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01';


/*
Creating View for Power BI which filters out all 'video games', 'straight to video prodcutions' and 'TV series' and focuses on modern productions
Only Productions with at least one million budget are considered
Only Productions with a clear associated Production Company are considered
Only Productions past January 1, 1990 are considered
*/
CREATE VIEW power_bi AS
SELECT id,
	title,
	release_date,
	revenue,
	budget,
	runtime,
	adult,
	original_language,
	original_title,
	genres,
	production_companies,
	directors,
	average_rating,
	main_genre,
	main_production_company,
	main_production_country,
	main_spoken_language,
	main_director,
	revenue_millions,
	budget_millions,
	net_revenue_millions,
	budget_to_revenue_ratio
FROM movies_analytics_final
WHERE revenue > 0
AND budget > 1000000
AND production_companies IS NOT NULL
AND genres IS NOT NULL
AND release_date > '1990-01-01';
# Movies-project
Private data analytics project which uses Python, SQL, and Power BI to create a Dashboard and to gain insights about the most successfull modern movie blockbusters.
## Project Overview

### 1. Download Dataset csv-files at kaggle.com 

To get the raw data for this project, I am using the Kaggle dataset found [here](https://www.kaggle.com/datasets/ggtejas/tmdb-imdb-merged-movies-dataset?select=TMDB++IMDB+Movies+Dataset.csv). 
Important: The unprocessed raw Dataset which is 240+ MB has been downloaded on 11-26-2024 for this project. 

### 2. Transforming the Data for Analytics and Loading it into the PostgreSQL database - Technologies: Jupyter Notebooks & VSCode

I prepared the data for ad-hoc analytics and loaded it into a PostgreSQL database to run SQL queries on the Dataset. I used IPYupiter-Notebooks in VSCode for this task. 
Please check out the file 'movies.ipynb' in the 'python' folder.

### 3. Create database 'movies' as well as table 'movie_analytics_final' - Technologies: PostgreSQL & PGAdmin4

I first created the necessary database 'movies' as well as the tables for this project. The data was loaded from the IPJupiter-Notebook into the PostgreSQL database after the tables were created.
Please see 'create_table.sql' in the 'sql' folder.

### 4. Doing ad-hoc analytics, adding information to the dataset and creating a view for the visualization in Power BI - Technologies: PostgreSQL & PGAdmin4

New information for analytics is created from the imported dataset by creating new columns and calculating values. Ad-hoc analytics is being performed and a view is being created which is the foundation for the Power BI Dashboard. Please see 'movies_analytics.sql' in the 'sql' folder.

### 5. Create Power BI Dashboard to answer the business questions - Technologies: Power BI - Technologies: Power BI

Import the data trough the created view into Power BI and create a dashboard, whith which every user can answer business questions about the financial success of movies. You can view the final Power BI dashboard named 'movies_analytics_final' in the 'power bi' folder.

The dashboard has complete interactive funcionality. All data can be filtered by clicking and selecting the desired values. Trough selecting the desired values, filteres are applied on the whole dashboard and aggregated values are shown on every card and chart.

Good KPIs to measure the financial success of every product is the revenue which is created from it. The revenue in relation to the spent budget answers if a product (in this case: a movie) is a success or not. Therefore the KPIs on top of the dashboard answer this question at a glance. Mainly the card 'Net Profit in Million $' gives information about how successfull a movie was. 

Also the card 'Budget to Revenue Ratio' tells to which factor the budget was transfered to revenue. A value of '2' means for every dollar budget the production company creted two dollars of revenue.

The scatter plot on the right side shows the top performing movies which generated 500 million dollar or more revenue and relates them to their user rating. The user rating is measured from 1 (not a good movie) to 10 (one of the best movies ever).

The table on the lower half of the board shows all data which aggregates to the results shown in charts and cards on the board. So it is possible to directly see every entry (movie) which correlated to the filtered result.

Finally on the right side you have filter options with which you can choose, release year, genre, production company, production country and director of all movies.

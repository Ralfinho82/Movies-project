# Movies Project

Private data analytics project utilizing Python, SQL, and Power BI to create a dashboard and gain insights into the most successful modern movie blockbusters.

## Project Overview

### 1. Download Dataset CSV Files from Kaggle  
To get the raw data for this project, I used the Kaggle dataset found [here](https://www.kaggle.com).  
**Important**: The unprocessed raw dataset, which is 240+ MB, was downloaded on 11-26-2024 for this project.

### 2. Transforming the Data for Analytics and Loading It into a PostgreSQL Database  
**Technologies**: Jupyter Notebooks & VSCode  
I prepared the data for ad-hoc analytics and loaded it into a PostgreSQL database to run SQL queries.  
I used Jupyter Notebooks in VSCode for this task. Please check out the file `movies.ipynb` in the `python` folder.

### 3. Creating the Database `movies` and the Table `movie_analytics_final`  
**Technologies**: PostgreSQL & PGAdmin4  
I created the `movies` database and the necessary tables for this project. The data was loaded from the Jupyter Notebook into the PostgreSQL database after the tables were created.  
Please refer to `create_table.sql` in the `sql` folder.

### 4. Performing Ad-Hoc Analytics, Enhancing the Dataset, and Creating a View for Visualization in Power BI  
**Technologies**: PostgreSQL & PGAdmin4  
I enhanced the dataset by creating new columns and calculating additional values for analytics. Ad-hoc analytics were performed, and a view was created, serving as the foundation for the Power BI dashboard.  
Please refer to `movies_analytics.sql` in the `sql` folder.

### 5. Creating a Power BI Dashboard to Answer Business Questions  
**Technologies**: Power BI  
The data was imported via the created view into Power BI, where an interactive dashboard was developed. This dashboard enables users to answer business questions about the financial success of movies.  
You can view the final Power BI dashboard named `movies_analytics_final` in the `power bi` folder.

---

## Dashboard Features  

- **Interactivity**: The dashboard is fully interactive. Users can filter data by clicking and selecting desired values. Filters are applied across the entire dashboard, and aggregated values are updated dynamically on all cards and charts.  
- **KPIs**:  
  - **Net Profit in Million $**: Provides a quick insight into how successful a movie was financially.  
  - **Budget-to-Revenue Ratio**: Indicates the revenue generated for every dollar spent. For example, a value of `2` means that for every dollar spent, two dollars of revenue were earned.  
- **Scatter Plot**: Displays top-performing movies (those generating $500 million or more in revenue) and their user ratings. Ratings range from 1 (poor) to 10 (excellent).  
- **Data Table**: A detailed table showing all data that contributes to the aggregated results displayed in the charts and cards. This enables direct exploration of individual entries (movies).  
- **Filters**: Options to filter data by release year, genre, production company, production country, and director.

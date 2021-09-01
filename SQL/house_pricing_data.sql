### EXPLORING HOUSING PRICES DATABASE WITH SQL ###

USE house_price_regression;
# Select all the data from table `house_price_data` to check if the data was imported correctly 

SELECT * FROM house_price_data
LIMIT 5;

# Use the alter table command to drop the column `date` from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.

ALTER TABLE house_price_data
DROP COLUMN date;

SELECT * FROM house_price_data
LIMIT 10;

# Use sql query to find how many rows of data you have.

SELECT COUNT(*) FROM house_price_data;

#  Now we will try to find the unique values in some of the categorical columns:

   # - What are the unique values in the column `bedrooms`?

SELECT DISTINCT(bedrooms) FROM house_price_data;

   # - What are the unique values in the column `bathrooms`?

SELECT DISTINCT(bathrooms) FROM house_price_data;

   # - What are the unique values in the column `floors`?

SELECT DISTINCT(floors) FROM house_price_data;

  #  - What are the unique values in the column `condition`?

SELECT DISTINCT(`condition`) FROM house_price_data;

  # - What are the unique values in the column `grade`?

SELECT DISTINCT(grade) FROM house_price_data;

# Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.

SELECT id
FROM house_price_data
ORDER BY price DESC
limit 10;

# What is the average price of all the properties in your data?

SELECT AVG(price) FROM house_price_data;

# In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

    - What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.

SELECT bedrooms, AVG(price) AS average_price
FROM house_price_data
GROUP BY bedrooms;

  #  - What is the average `sqft_living` of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the `sqft_living`. Use an alias to change the name of the second column.

SELECT bedrooms, AVG(sqft_living) AS average_living_space
FROM house_price_data
GROUP BY bedrooms;

  #  - What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and `Average` of the prices. Use an alias to change the name of the second column.

SELECT waterfront, AVG(price) AS average_price
FROM house_price_data
GROUP BY waterfront;

 #   - Is there any correlation between the columns `condition` and `grade`? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.

SELECT (AVG(`condition` * `grade`) - AVG(`condition`) + AVG(`grade`)) / (STDDEV(`condition`) * STDDEV(`grade`)) / 100 as correlation
FROM house_price_data;

## OR ##

SELECT `condition`, AVG(grade)
FROM house_price_data
GROUP BY `condition`
ORDER BY `condition`;

# There is a correlation between `condition` and `grade` columns, though not significant.

#* MySQL STDDEV() function returns the population standard deviation of expression. The STDDEV() function is used to calculate statistical information for a specified numeric field in a query.

 #   You might also have to check the number of houses in each category (ie number of houses for a given `condition`) to assess if that category is well represented in the dataset to include it in your analysis. For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis

Select COUNT(id) AS number_of_houses, `condition`
FROM house_price_data
GROUP BY `condition`;

# Observation: both 'condition' '1' and '2' have relatively low representation in data - will verify this in pyhton workbook further and decide.

# One of the customers is only interested in the following houses:

  #  - Number of bedrooms either 3 or 4
  #  - Bathrooms more than 3
  #  - One Floor
  #  - No waterfront
  #  - Condition should be 3 at least
  #  - Grade should be 5 at least
  #  - Price less than 300000

  #  For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?

SELECT id,
FROM house_price_data
WHERE bedrooms = 3 OR bedrooms = 4 AND bathrooms > "3" AND floors = 1 AND waterfront = 0 AND grade >= 5 AND `condition` >= 3
HAVING price < 300000;

# Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.

SELECT * 
FROM house_price_data 
WHERE price > (SELECT AVG(price)*2 FROM house_price_data);

# Since this is something that the senior management is regularly interested in, create a view called `Houses_with_higher_than_double_average_price` of the same query.

CREATE VIEW Houses_with_higher_than_double_average_price AS
SELECT * 
FROM house_price_data 
WHERE price > (SELECT AVG(price)*2 FROM house_price_data);

SELECT * FROM Houses_with_higher_than_double_average_price;

# Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms? In this case you can simply use a group by to check the prices for those particular houses

SELECT bedrooms, AVG(price) AS average_price
FROM house_price_data
WHERE bedrooms BETWEEN 3 AND 4
GROUP BY bedrooms;

# What are the different locations where properties are available in your database? (distinct zip codes)

SELECT DISTINCT(zipcode) FROM house_price_data;

# Show the list of all the properties that were renovated.

SELECT DISTINCT(yr_renovated) FROM house_price_data;

SELECT * FROM house_price_data
WHERE yr_renovated != 0;

# Provide the details of the property that is the 11th most expensive property in your database.

SELECT *
FROM house_price_data
ORDER BY price DESC LIMIT 1 OFFSET 10;

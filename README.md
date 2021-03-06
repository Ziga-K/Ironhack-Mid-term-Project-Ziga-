### Ironhack Mid-term Project

# House Pricing - Data Analysis & Predicting Market Value

<img src="https://miro.medium.com/max/1400/1*2djb7kXk2I4SNLBHogl87Q.jpeg" width="100%"></img>

## Background/objective: 

We are working as an analyst for a real estate company. The ompany wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated. We will also be exploring the data to better undestand with with set questions and present the data visually. 

## Data:

The data set consists of information on some 22,000 properties.  The dataset consisted of historic data of houses sold between May 2014 to May 2015.



### We will try to achieve this in 3 chapters based on the tools used:

***1.Python***: Dataset explore and processing with intent to build several machine learning models to predict housing values. 

***Variables Description***
- id - Identification
- date - Date sold
- price - Sale price
- bedrooms - Number of bedrooms
- bathrooms - Number of bathrooms
- sqft_liv - Size of living area in square feet
- sqft_lot - Size of the lot in square feet
- floors - Number of floors
- waterfront - ‘1’ if the property has a waterfront, ‘0’ if not.
- view - An index from 0 to 4 of how good the view of the property was
- condition - Condition of the house, ranked from 1 to 5
- grade - Classification by construction quality which refers to the types of materials used and the quality of workmanship. Buildings of better quality (higher grade) cost more to build per unit of measure and command higher value.
- sqft_above - Square feet above ground
- sqft_basmt - Square feet below ground
- yr_built - Year built
- yr_renov - Year renovated. ‘0’ if never renovated
- zipcode - 5 digit zip code
- lat - Latitude
- long - Longitude
- squft_liv15 - Average size of interior housing living space for the closest 15 houses, in - square feet
- squft_lot15 - Average size of land lots for the closest 15 houses, in square feet

***Steps from notebook:***

- Import necessary libraries
- Read data into workbook

    * Exploring and processing:
- check number of entries by columns
- check column names
- check nuls and column types
- initial statistics check
- check for duplicates with the 'id' column
- remove 'id' column as irelevant for the purpose of ML
- combine bed and bathroom column into one column 'rooms' and check how it effects correlation
- convert floors and rooms into 'int' data type
- split and convert the 'date' column in to year, month,day columns to enrich data
- convert 'long' into positive value column
    This was initially done to use boxcox transformation later on, however it still did not work
    (to be addressed in future work)
- using plots to explore distribution and outliers
    right skewed data as well as some outliers
- Checking correlation of columns with price
    most relevant columns: sqft_living, grade, sqft_living15, rooms, view

    * Machine learning:
- Data split
- Function with 3 different models: LinearRegression, KNeighborsRegressor, MLPRegressor
- print R2 Score for each model
- print 10 results comparing predicted and actual data
- capping outliers using the winsorize method
- checking outliers with describe function and plots
- running machine learning on capped data

**Conclusion**:
I aimed to keep as much data as possible.
Linear Regression model seems to perform best both runs with the data processing done. 
After capping outliers the score had a notable change for the better.
- 1st run:
<img src="https://github.com/Terminal-zkolar/Ironhack-Mid-term-Project-Ziga-/blob/main/Screenshots/1st%20run%20r2.png" width="40%"></img>
<img src="https://github.com/Terminal-zkolar/Ironhack-Mid-term-Project-Ziga-/blob/main/Screenshots/1st%20comp.png" width="40%"></img>

- 2nd run:
<img src="https://github.com/Terminal-zkolar/Ironhack-Mid-term-Project-Ziga-/blob/main/Screenshots/2nd%20run%20r2.png" width="40%"></img>
<img src="https://github.com/Terminal-zkolar/Ironhack-Mid-term-Project-Ziga-/blob/main/Screenshots/2nd%20comp.png" width="40%"></img>

**Future work**:
- try transform data with techniques like log, boxcox, scaling see how effect the model
- Try to convert some column to categorical ones and run the model again (which and why) - example waterfront,view,condition
- undestand the statistical relevancy and relationship of data better
- better functions to automate code and displaying results/ tables


***Libraries used:***
-  [pandas](https://pandas.pydata.org/)<br> 
-  [numpy](https://numpy.org/doc/)<br>
-  [seaborn](https://seaborn.pydata.org/)<br>
-  [matplotlib.pyplot](https://matplotlib.org/3.1.1/contents.html)<br>
-  [statsmodels](https://www.statsmodels.org/stable/index.html)<br>
-  [scipy.stats](https://docs.scipy.org/doc/scipy/reference/stats.html)<br>
-  [sklearn.model_selection](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.train_test_split.html)<br>
-  [sklearn.neighbors](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html)<br>
-  [sklearn.neural_network](https://scikit-learn.org/stable/modules/generated/sklearn.neural_network.MLPClassifier.html)<br>
-  [sklearn.datasets](https://scikit-learn.org/stable/datasets.html)<br>
-  [sklearn.linear_model](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html)<br>
-  [sklearn.metrics](https://scikit-learn.org/stable/modules/model_evaluation.html)<br>
-  [warnings](https://docs.python.org/3/library/warnings.html)<br>

***Additional settings:***
- warnings.filterwarnings('ignore')
- pd.set_option('display.max_columns', None)

***2.SQL***: Exploring data with answering set questions using SQL queries

***3.Tableau***: Exploring data with answering set questions visually

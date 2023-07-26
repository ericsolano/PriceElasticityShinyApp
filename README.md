Price Elasticity of Demand
========================================================
author: Eric Solano  
date: November 22, 2015  
updated: July 26, 2023  

Tafeng Dataset
=======================================================

The Tafeng dataset contains information about individual transactions for thousands of grocery products.   

Features include:

1. Product id
2. Customer information
3. Units of product purchased
4. Sales price



Price Elasticity
========================================================

Price elasticity for an individual product is calculated using the sales information for that product. 

Elasticity is calculated with linear regression:  

log(Q) = k + E*log(P)

where:

1. Q is the total daily demand
2. P is the average daily price
3. E is elasticity
4. k is a constant.



Total Daily Sales
========================================================

The following plot shows the total daily sales for one of the products. The dataset contains
data with individual transactions for 4 consecutive months. This plot was obtained by aggregating the daily transactions for the product.  



Product Price Elasticity
========================================================

The following plot shows Total Daily Demand versus Average Daily Price and the regression line
for the product.  

The price elasticity value obtained using linear regression was -0.924 which means that
for each 1% in price reduction there will be a 0.924% increase in demand.


